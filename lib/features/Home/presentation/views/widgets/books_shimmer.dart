import 'package:book_list_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BooksShimmer extends StatelessWidget {
  const BooksShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kGreyColor[300]!,
      highlightColor: kGreyColor[100]!,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Text Columns Placeholder
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 14, width: 120, color: kWhiteColor), // Author
                const SizedBox(height: 6),
                Container(height: 16, width: 180, color: kWhiteColor), // Title
                const SizedBox(height: 12),

                Container(height: 12, width: double.infinity, color: kWhiteColor), // Summary line 1
                Container(height: 12, width: double.infinity, color: kWhiteColor), // Summary line 2
                Container(height: 12, width: double.infinity, color: kWhiteColor), // Summary line 3
              ],
            ),
          ),
        ],
      ),
    );
  }
}
