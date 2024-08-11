import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget customVerticalDivider({required Color color}) {
  return Container(
    height: 5.h, // Responsive height
    width: 0.3.w, // Responsive width (thickness)
    color: color,
  );
}
