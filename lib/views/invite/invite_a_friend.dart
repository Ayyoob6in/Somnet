import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';
import 'package:somenet/views/widgets/custom_button_widget.dart';

class InviteAFriendScreen extends StatelessWidget {
  const InviteAFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: sWhite,
          title: Text(
            "Create New Ticket",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.spa),
          ),
        ),
        backgroundColor: appBackgroundColor,
        body: Column(children: [
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.all(18.sp),
            //height: 20.h,

            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 25.sp,
                  child: Image.asset(inviteafriendIcon),
                ),
                Padding(
                  padding: EdgeInsets.all(14.sp),
                  child: Text(
                    "Share the Somnet Selfcare App with friends to get the better Service Experience ever",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center, // Center the text
                  ),
                ),
              ],
            ),
          ),
          customButton(context: context, onPress: () {}, text: "Share")
        ]));
  }
}
