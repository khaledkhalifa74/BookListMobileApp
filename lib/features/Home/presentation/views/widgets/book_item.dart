import 'package:book_list_app/core/utils/colors.dart';
import 'package:book_list_app/core/utils/styles.dart';
import 'package:book_list_app/features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookItem extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String summary;

  const BookItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.summary,
  });

  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: kBorderColor,
          width: 2
        ),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: CustomBookImage(imageUrl: widget.imageUrl),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    widget.author,
                    style: Styles.textStyle14,
                ),
                const SizedBox(height: 4),
                Text(
                  widget.title,
                  style: Styles.textStyle16,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.summary,
                  style: Styles.textStyle14,
                  maxLines: isExpanded ? null : 3,
                  overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                ),
                if (isSummaryLong(context))
                  InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                    },
                    splashFactory: InkRipple.splashFactory,
                    child: Text(
                        isExpanded
                            ? 'See Less'
                            : 'See More',
                      style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  bool isSummaryLong(BuildContext context) {
    final textPainter = TextPainter(
      text: TextSpan(text: widget.summary, style: Styles.textStyle14),
      maxLines: 3,
      textDirection: TextDirection.ltr,
    )..layout(
      maxWidth: MediaQuery.of(context).size.width - 120,
    );

    return textPainter.didExceedMaxLines;
  }
}

