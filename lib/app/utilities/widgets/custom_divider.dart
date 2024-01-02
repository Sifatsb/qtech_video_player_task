import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  const CustomDivider({

    this.height,
    this.width,
    this.color,

    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 500,
      height: height ?? 1,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: color ??  const Color(0xFFE2E8F0),
          ),
        ),
      ),
    );
  }
}
