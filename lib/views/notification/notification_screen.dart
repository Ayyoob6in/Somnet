import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/views/notification/widgets/notification_card_widget.dart';
import 'package:somenet/views/widgets/custom_heading_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 7.h, left: 6.w, bottom: 3.h),
            child: const CustomHeadingWidget("Notification"),
          ),
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 0),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const NotificationCardWidget(
                      title: 'Package Purchase',
                      message:
                          'Dear Customer, you have bought 70 Min for 30 days',
                      dateTime: '17-05-2021 20:52',
                    );
                  }))
        ],
      ),
    );
  }
}
