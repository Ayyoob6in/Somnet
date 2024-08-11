import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';

class NotificationCardWidget extends StatelessWidget {
  final String title;
  final String message;
  final String dateTime;

  const NotificationCardWidget({
    super.key,
    required this.title,
    required this.message,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: Card(
        color: sWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle(title),
              SizedBox(height: 2.h),
              _buildMessage(message),
              SizedBox(height: 1.h),
              _buildDateTime(dateTime),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: colorblue,
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
    );
  }

  Widget _buildMessage(String message) {
    return Text(
      message,
      style: TextStyle(
        color: sBlack,
        fontSize: 15.sp,
      ),
    );
  }

  Widget _buildDateTime(String dateTime) {
    return Text(
      dateTime,
      style: TextStyle(
        color: sGrey,
        fontSize: 14.sp,
      ),
    );
  }
}
