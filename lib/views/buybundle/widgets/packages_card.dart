import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart'; // Import Sizer
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';

class PackageCardNormal extends StatelessWidget {
  final String data;
  final String packageType;
  final String duration;
  final String price;
  final VoidCallback onTap;

  const PackageCardNormal({
    super.key,
    required this.data,
    required this.packageType,
    required this.duration,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 1.h, horizontal: 4.w), // Use Sizer for padding
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(4.w), // Use Sizer for padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      buybunldelistnormallogo,
                      height: 3.5.h, // Scale with Sizer
                      width: 3.5.h, // Scale with Sizer
                    ),
                    SizedBox(width: 2.w), // Use Sizer for spacing
                    Text(
                      data,
                      style: TextStyle(
                        fontSize: 16.sp, // Scale with Sizer
                        fontWeight: FontWeight.bold,
                        color: colorblue,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      packageType,
                      style: TextStyle(
                        fontSize: 14.sp, // Scale with Sizer
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 0.5,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Colors.orange,
                          size: 20.sp,
                        ),
                        SizedBox(width: 1.5.w), // Use Sizer for spacing
                        Text(
                          duration,
                          style: TextStyle(
                            fontSize: 14.sp, // Scale with Sizer
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 14.sp, // Scale with Sizer
                        fontWeight: FontWeight.bold,
                        color: colorblue,
                      ),
                    ),
                    SizedBox(width: 2.w), // Use Sizer for spacing
                    Icon(
                      Icons.arrow_forward,
                      color: colorblue,
                      size: 17.sp, // Scale with Sizer
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
