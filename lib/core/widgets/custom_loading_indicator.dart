import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  const CustomLoadingIndicator({super.key, this.color, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CircularProgressIndicator(
        color: color ?? Colors.white,
      ),
    );
  }
}
