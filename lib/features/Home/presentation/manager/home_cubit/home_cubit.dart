import 'package:book_list_app/core/errors/failures.dart';
import 'package:book_list_app/core/utils/api_service.dart';
import 'package:book_list_app/features/Home/data/models/book_model/book_model.dart';
import 'package:book_list_app/features/Home/data/models/book_model/results.dart';
import 'package:book_list_app/features/Home/presentation/manager/home_cubit/home_state.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  
  static HomeCubit get(context) => BlocProvider.of(context);

  static int pageSize = 32;
  BookModel? bookModelResponse;
  final PagingController<int, Results?> booksPagingController = PagingController(firstPageKey: 1);
  Future<Either<Failure, BookModel>> fetchBooks(int pageKey) async {
    try {
      emit(StartLoadingFetchBooks());
      final response = await ApiService.get(url: 'books/?page=$pageKey');
      bookModelResponse = BookModel.fromJson(response.data);
        if (bookModelResponse!.results!.isNotEmpty) {
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
    } on Exception catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<void> fetchBooksInitialize() async {
    booksPagingController.addPageRequestListener((pageKey) {
      fetchBooks(pageKey);
    });
  }

}