import 'package:book_list_app/core/utils/colors.dart';
import 'package:book_list_app/core/widgets/custom_text_field.dart';
import 'package:book_list_app/core/widgets/error_paging_items.dart';
import 'package:book_list_app/features/Home/data/models/book_model/results.dart';
import 'package:book_list_app/features/Home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:book_list_app/features/Home/presentation/manager/home_cubit/home_state.dart';
import 'package:book_list_app/features/Home/presentation/views/widgets/book_item.dart';
import 'package:book_list_app/features/Home/presentation/views/widgets/books_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final homeCubit = HomeCubit.get(context);
        return RefreshIndicator(
          onRefresh: () => Future.sync(
                () => homeCubit.booksPagingController.refresh(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              children: [
                const SizedBox(height: 48),
                CustomTextFormField(
                  placeholder: 'Explore the world of books..',
                  controller: searchController,
                  onSubmitted: (value) {
                    homeCubit.updateSearchQuery(value);
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      homeCubit.updateSearchQuery(searchController.text);
                    },
                    icon: const Icon(
                      Iconsax.search_normal,
                      color: kDarkBlackColor,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                    child: PagedListView<int, Results?>(
                      pagingController:
                      homeCubit.booksPagingController,
                      builderDelegate: PagedChildBuilderDelegate<Results?>(
                        firstPageProgressIndicatorBuilder: (context){
                          return Column(
                            children: List.generate(10, (index) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: BooksShimmer(),
                              );
                            }),
                          );
                        },
                        firstPageErrorIndicatorBuilder: (context) {
                          return Center(
                            child: ErrorLoadingItem(
                              onTap: () {
                                homeCubit.booksPagingController
                                    .refresh();
                              },
                              failedText: 'Failed to load books',
                            ),
                          );
                        },
                        noItemsFoundIndicatorBuilder: (context) {
                          return Center(
                            child: NoItemsWidget(
                              text: 'There are no books',
                            ),
                          );
                        },
                        itemBuilder: (context, item, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: BookItem(
                                title: item!.title!,
                                imageUrl: item.formats!.imageJpeg!,
                                author: (item.authors?.isNotEmpty ?? false)
                                    ? item.authors![0].name.toString()
                                    : 'No authors available',
                                summary: (item.summaries?.isNotEmpty ?? false)
                                    ? item.summaries![0].toString()
                                    : 'No summary available',
                               ),
                          );
                        },
                      ),
                    ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
