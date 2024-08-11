import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';

class InviteAFriendScreen extends StatelessWidget {
  const InviteAFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBackgroundColor,
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Container(
              height: 50.h,
              padding: EdgeInsets.all(16.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              child: CircleAvatar(
                radius: 25.sp,
                child: Image.asset(inviteafriendIcon),
              ),
            ),
          )
        ]));
  }
}
