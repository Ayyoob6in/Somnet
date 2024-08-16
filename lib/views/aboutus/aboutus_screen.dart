import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';
import 'package:somenet/views/widgets/custom_button_widget.dart';

class AboutusScreen extends StatelessWidget {
  const AboutusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: sWhite,
          title: Text(
            "About us",
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
                SizedBox(
                  height: 2.h,
                ),
                Image.asset(
                  applogo,
                  height: 9.h,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.all(14.sp),
                  child: Text(
                    '''SomNet provides the First and fastest 4G LTE Network in Somalia and mobile services that allow you to talk as long as you like!

Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words

Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words ''',
                    style: TextStyle(
                      fontSize: 13.8.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    //textAlign: TextAlign.center, // Center the text
                  ),
                ),
              ],
            ),
          ),

          //customButton(context: context, onPress: () {}, text: "Share")
        ]));
  }
}
