import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';

Widget buildDrawerItem(
    {required String title,
    required String image,
    required VoidCallback onTap}) {
  return ListTile(
    contentPadding:
        EdgeInsets.symmetric(horizontal: 23.w), // Adjust horizontal padding
    leading: CircleAvatar(
      radius: 17.sp,
      backgroundColor: textfieldfilled,
      child: Image.asset(image),
    ),
    title: Text(
      title,
      style: TextStyle(
          color: sBlack, fontSize: 1.3.h, fontWeight: FontWeight.w500),
    ),
    onTap: onTap,
  );
}
