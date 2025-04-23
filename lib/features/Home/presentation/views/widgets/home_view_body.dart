import 'package:book_list_app/core/utils/colors.dart';
import 'package:book_list_app/core/widgets/custom_text_field.dart';
import 'package:book_list_app/features/Home/data/models/book_model/results.dart';
import 'package:book_list_app/features/Home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:book_list_app/features/Home/presentation/manager/home_cubit/home_state.dart';
import 'package:book_list_app/features/Home/presentation/views/widgets/book_item.dart';
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
                  placeholder: 'Search',
                  controller: searchController,
                  onSubmitted: (value) {},
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.search_normal,
                      color: kDarkBlackColor,
                    ),
                  ),
                ),
                Expanded(
                    child: PagedListView<int, Results?>(
                      pagingController:
                      homeCubit.booksPagingController,
                      builderDelegate: PagedChildBuilderDelegate<Results?>(
                        firstPageErrorIndicatorBuilder: (context) {
                          return SizedBox();
                          // return ErrorLoadingItem(
                          //   onTap: () {
                          //     ethpatatCubit.searchedProvesPagingController
                          //         .refresh();
                          //   },
                          //   failedText: AppLocalizations.of(context)!
                          //       .failedToLoadEthpatat,
                          // );
                        },
                        noItemsFoundIndicatorBuilder: (context) {
                          return SizedBox();
                          // return NoItemsWidget(
                          //   text: AppLocalizations.of(context)!.noProves,
                          // );
                        },
                        itemBuilder: (context, item, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: BookItem(
                                title: item!.title!,
                                imageUrl: item.formats!.imageJpeg!,
                                author: item.authors![0].name!,
                                summary: item.summaries![0].toString(),
                               ),
                          );
                        },
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
