import 'package:book_list_app/core/utils/assets.dart';
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
            MediaQuery.sizeOf(context).height * .18,
          ),
          Image.asset(AssetsData.noBooks),
          const SizedBox(height: 24),
          Text(
            text,
            style: Styles.textStyle20,
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
            Image.asset(AssetsData.noBooks),
            SizedBox(height: 32),
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
              itemCallBack: onTap,
            )
          ],
        ),
      ),
    );
  }
}