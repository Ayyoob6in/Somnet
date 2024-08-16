import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';

class CustomHeadingWidget extends StatelessWidget {
  final String text;

  const CustomHeadingWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20.sp,
        color: colorblue.withOpacity(0.4),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

// Usage:
