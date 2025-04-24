import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BooksShimmer extends StatelessWidget {
  const BooksShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                  Container(height: 14, width: 120, color: Colors.white), // Author
                  const SizedBox(height: 6),
                  Container(height: 16, width: 180, color: Colors.white), // Title
                  const SizedBox(height: 12),

                  Container(height: 12, width: double.infinity, color: Colors.white), // Summary line 1
                  Container(height: 12, width: double.infinity, color: Colors.white), // Summary line 2
                  Container(height: 12, width: double.infinity, color: Colors.white), // Summary line 3
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
