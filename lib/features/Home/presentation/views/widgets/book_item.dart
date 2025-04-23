import 'package:book_list_app/core/utils/styles.dart';
import 'package:book_list_app/features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String summary;
  const BookItem({super.key, required this.imageUrl, required this.title, required this.author, required this.summary});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          CustomBookImage(
            imageUrl: imageUrl,
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width *0.5,
                  child: Text(
                    title,
                    style: Styles.textStyle20,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  author,
                  style: Styles.textStyle14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
