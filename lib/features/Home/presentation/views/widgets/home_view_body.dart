import 'package:book_list_app/core/utils/colors.dart';
import 'package:book_list_app/core/widgets/custom_text_field.dart';
import 'package:book_list_app/features/Home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        BookItem(
            imageUrl: 'https://marketplace.canva.com/EAFPHUaBrFc/1/0/1003w/canva-black-and-white-modern-alone-story-book-cover-QHBKwQnsgzs.jpg',
            title: 'title',
            author: 'author',
            summary: 'summary',
        )
      ],
    );
  }
}
