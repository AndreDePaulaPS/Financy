import 'package:flutter/material.dart';

class AppSkeleton extends StatelessWidget {
  final double? width;
  final double height;
  final BorderRadius? borderRadius;
  final ShapeBorder? shape;

  const AppSkeleton({
    super.key,
    this.width,
    required this.height,
    this.borderRadius,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: Colors.grey.shade300,
        shape:
            shape ??
            RoundedRectangleBorder(
              borderRadius:
                  borderRadius ??
                  BorderRadius.circular(8),
            ),
      ),
    );
  }
}