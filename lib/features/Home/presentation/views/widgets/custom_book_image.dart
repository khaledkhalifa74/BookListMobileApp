
import 'package:book_list_app/core/widgets/cached_image_error.dart';
import 'package:book_list_app/core/widgets/custom_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: CachedNetworkImage(
        height: 150,
        fit: BoxFit.fill,
        imageUrl: imageUrl ?? '',
        placeholder: (context, url)
        => const Center(
            child: CustomLoadingIndicator(),
        ),
        errorWidget: (context, url, error)
          => const CachedImageError(),
      ),
    );
  }
}

