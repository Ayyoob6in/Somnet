import 'package:flutter/material.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';
import 'package:sizer/sizer.dart';

class CustomMyvascard extends StatelessWidget {
  const CustomMyvascard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: sWhite,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.sp), // Use sp for responsiveness
      ),
      child: Padding(
        padding: EdgeInsets.all(4.w), // Adjust padding based on screen width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      myvasListIcon,
                      width: 10.w, // Adjust icon size based on screen width
                      height: 10.w, // Keep aspect ratio
                    ),
                    SizedBox(
                        width: 2.w), // Adjust spacing based on screen width
                    Text(
                      'Fariin-Wadaag',
                      style: TextStyle(
                        fontSize:
                            18.sp, // Adjust font size based on screen width
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Switch(
                  value: true, // Example toggle state
                  onChanged: (bool value) {},
                  activeColor: colorblue,
                  inactiveThumbColor: sBlack,
                ),
              ],
            ),
            SizedBox(height: 1.h), // Adjust spacing based on screen height
            Text(
              'Fariin-Wadaag a chatting application that allows users to chat via private and public groups ...',
              style: TextStyle(
                fontSize: 14.sp, // Adjust font size based on screen width
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 1.5.h), // Adjust spacing based on screen height
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8.sp),
              ),
              child: Text(
                '\$0.0166 / day',
                style: TextStyle(
                  fontSize: 14.sp, // Adjust font size based on screen width
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
