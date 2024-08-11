import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/views/widgets/custom_vertical_divider.dart';

Widget pinpukCard(
    {required String firstTitle,
    required String secondTitle,
    required String codeone,
    required String codetwo}) {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: 5.w, vertical: 2.h), // Responsive padding
    margin: EdgeInsets.symmetric(
        horizontal: 4.w), // Optional margin to center the card
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(2.w), // Responsive border radius
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              firstTitle,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13.sp, // Responsive font size
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 1.h), // Responsive spacing
            Text(
              codeone,
              style: TextStyle(
                color: colorblue,
                fontSize: 16.sp, // Responsive font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        customVerticalDivider(color: Colors.blue.shade100),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              secondTitle,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13.sp, // Responsive font size
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 1.h), // Responsive spacing
            Text(
              codetwo,
              style: TextStyle(
                color: colorblue,
                fontSize: 16.sp, // Responsive font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
