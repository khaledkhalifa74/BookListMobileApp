import 'package:book_list_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CachedImageError extends StatelessWidget {
  const CachedImageError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Opps, there was an error',
          style: Styles.textStyle14,
        ),
        const SizedBox(
          height: 8,
        ),
        const Icon(Icons.error,size: 32,),
      ],
    );
  }
}
