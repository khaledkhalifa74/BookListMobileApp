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
    return Padding(
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
          const SizedBox(height: 32),
          BookItem(
              imageUrl: 'https://marketplace.canva.com/EAFPHUaBrFc/1/0/1003w/canva-black-and-white-modern-alone-story-book-cover-QHBKwQnsgzs.jpg',
              title: 'This is title for the book',
              author: 'Author',
              summary: 'This is summary about the book This is summary about the book',
          )
        ],
      ),
    );
  }
}
