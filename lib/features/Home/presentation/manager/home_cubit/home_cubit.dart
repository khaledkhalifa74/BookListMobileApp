import 'package:book_list_app/core/errors/failures.dart';
import 'package:book_list_app/core/utils/api_service.dart';
import 'package:book_list_app/features/Home/data/models/book_model/book_model.dart';
import 'package:book_list_app/features/Home/data/models/book_model/results.dart';
import 'package:book_list_app/features/Home/presentation/manager/home_cubit/home_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  
  static HomeCubit get(context) => BlocProvider.of(context);

  static int pageSize = 32;
  BookModel? bookModelResponse;
  final PagingController<int, Results?> booksPagingController = PagingController(firstPageKey: 1);

  String? searchQuery;
  void updateSearchQuery(String query) {
    searchQuery = query.trim().isEmpty ? null : query.trim();
    booksPagingController.refresh();
  }

  // check internet connection
  Future<bool> _isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if(connectivityResult.contains(ConnectivityResult.none)){
      return false;
    }else{
      return true;
    }
  }

  // Fetch books
  Future<Either<Failure, BookModel>> fetchBooks(int pageKey) async {
    try {
      emit(StartLoadingFetchBooks());
      bool isConnected = await _isConnected();
      final String endpoint = searchQuery != null
          ? 'books/?search=${Uri.encodeComponent(searchQuery!)}&page=$pageKey'
          : 'books/?page=$pageKey';
      if(isConnected){
        final response = await ApiService.get(url: endpoint);
        bookModelResponse = BookModel.fromJson(response.data);
        if (bookModelResponse!.results!.isNotEmpty) {
          await cacheBooks(bookModelResponse!.results!);
          if (bookModelResponse!.next == null) {
            booksPagingController.appendLastPage(bookModelResponse!.results!);
          } else {
            final nextPageKey = pageKey + 1;
            booksPagingController.appendPage(bookModelResponse!.results!, nextPageKey);
          }
        } else {
          booksPagingController.appendLastPage([]);
        }
        emit(StopLoadingFetchBooks());
        return right(bookModelResponse!);
      }else{
        final cachedBooks = await getCachedBooks();
        if (cachedBooks.isNotEmpty) {
          booksPagingController.appendPage(cachedBooks, 2);
        } else {
          booksPagingController.appendLastPage([]);
        }
        emit(StopLoadingFetchBooks());
        return right(bookModelResponse ?? BookModel());
      }
    } on Exception catch (e) {
      if(e is DioException){
        List<Results> cachedBooks = await getCachedBooks();
        return right(BookModel(results: cachedBooks));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  Future<void> fetchBooksInitialize() async {
    booksPagingController.addPageRequestListener((pageKey) {
      fetchBooks(pageKey);
    });
  }

  // Cache books
  Future<void> cacheBooks(List<Results> bookList) async {
    var box = await Hive.openBox<Results>('resultsBox');
    await box.addAll(bookList);
  }

  // Retrieve cached books
  Future<List<Results>> getCachedBooks() async {
    var box = await Hive.openBox<Results>('resultsBox');
    return box.values.toList();
  }

}