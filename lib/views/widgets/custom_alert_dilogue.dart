import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget customAlertDialog(
    {required BuildContext context,
    required String title,
    required String textfieldtext}) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0), // Rounded corners
    ),
    title: Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    ),
    content: Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1), // Light blue background
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Text(
        textfieldtext,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          'Cancel',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          // Add your action here
          Navigator.of(context).pop();
        },
        child: Text(
          'OK',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}
