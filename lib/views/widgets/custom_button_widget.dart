import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';

Widget customButton({
  required BuildContext context,
  required VoidCallback onPress,
  required String text,
}) {
  return Padding(
    padding: EdgeInsets.only(left: 5.w, right: 5.w),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shadowColor: sGrey,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10.sp), // Responsive border radius
        ),
        // padding: EdgeInsets.symmetric(
        //     vertical: 1.5.h, horizontal: 15.w), // Responsive padding
      ),
      onPressed: onPress,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 2.h,
              color: sWhite,
              fontWeight: FontWeight.w600), // Responsive text size
        ),
      ),
    ),
  );
}
