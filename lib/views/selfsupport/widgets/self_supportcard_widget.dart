import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';

Widget selfSupportCard(String title, String icon, Function()? ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF279AD2), // #279AD2
                      Color(0xFF52BBE8), // #52BBE8
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                icon,
                color: sWhite,
                height: 15.h,
                width: 15.h,
              )),
          SizedBox(width: 4.w),
          Text(
            title,
            overflow: TextOverflow.fade,
            maxLines: 2,
            style: TextStyle(
              fontSize: 1.5.h,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
