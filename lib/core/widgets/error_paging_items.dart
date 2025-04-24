import 'package:book_list_app/core/utils/assets.dart';
import 'package:book_list_app/core/utils/colors.dart';
import 'package:book_list_app/core/utils/styles.dart';
import 'package:book_list_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class NoItemsWidget extends StatelessWidget {
  final String text;
  const NoItemsWidget({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height:
            MediaQuery.sizeOf(context).height * .2,
          ),
          Image.asset(
              AssetsData.noBooks,
            height: 80,
            width: 80,
          ),
          const SizedBox(height: 24),
          Text(
            text,
            style: Styles.textStyle20,
          ),
          const SizedBox(height: 4),
          Text(
            'Try adjusting your search or check back later.',
            style: Styles.textStyle14.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
class ErrorLoadingItem extends StatelessWidget {
  final void Function() onTap;
  final String failedText;
  const ErrorLoadingItem({
    super.key, required this.onTap, required this.failedText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height:
              MediaQuery.sizeOf(context).height * .18,
            ),
            Image.asset(
                AssetsData.noBooks,
              height: 80,
              width: 80,
            ),
            SizedBox(height: 16),
            Text(
              textAlign: TextAlign.center,
              failedText,
              style: Styles.textStyle16,
            ),
            Text(
              textAlign: TextAlign.center,
              'Something went wrong, please try again',
              style: Styles.textStyle16,
            ),
            SizedBox(height: 16),
            CustomButton(
              width: 150,
              height: 50,
              text: 'Retry',
              textColor: kDarkBlackColor,
              itemCallBack: onTap,
            )
          ],
        ),
      ),
    );
  }
}