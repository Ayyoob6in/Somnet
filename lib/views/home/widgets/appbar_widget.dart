import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart'; // Import Sizer
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: colorblue,
    automaticallyImplyLeading: false,
    flexibleSpace: Padding(
      padding: EdgeInsets.all(4.w), // Use Sizer for responsive padding
      child: Row(
        children: [
          CircleAvatar(
            radius: 7.w, // Use Sizer for responsive radius
            backgroundImage: const AssetImage(
              profileimage,
            ),
          ),
          SizedBox(width: 4.w), // Use Sizer for responsive spacing
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Muhsin Vivacom',
                style: TextStyle(
                  fontSize: 14.sp, // Use Sizer for responsive font size
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                      radius: 2.w, // Use Sizer for responsive radius
                      backgroundColor: sBlack.withOpacity(0.1),
                      child: Icon(
                        Icons.phone,
                        size: 2.5.w, // Use Sizer for responsive icon size
                        color: sWhite,
                      )),
                  SizedBox(width: 2.w), // Use Sizer for responsive spacing
                  Text(
                    '615 209444',
                    style: TextStyle(
                      fontSize: 10.sp, // Use Sizer for responsive font size
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 10.w, // Use Sizer for responsive height
            width: 10.w, // Use Sizer for responsive width
            decoration: BoxDecoration(
                color: sWhite,
                borderRadius: BorderRadius.circular(
                    2.w)), // Use Sizer for responsive border radius
            child: IconButton(
              onPressed: () {
                // Handle message icon tap
              },
              icon: Icon(
                Icons.message_outlined,
                size: 6.w, // Use Sizer for responsive icon size
              ),
              color: colorblue,
            ),
          ),
        ],
      ),
    ),
  );
}
