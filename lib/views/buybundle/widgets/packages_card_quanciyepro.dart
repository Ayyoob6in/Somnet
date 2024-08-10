import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart'; // Import Sizer
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';

class PackageCardQuanciyePro extends StatelessWidget {
  final String data;
  final String subData;
  final String packageType;
  final String duration;
  final String price;
  final VoidCallback onTap;

  const PackageCardQuanciyePro({
    super.key,
    required this.data,
    required this.packageType,
    required this.duration,
    required this.price,
    required this.onTap,
    required this.subData,
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
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(4.w), // Use Sizer for padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.asset(
                    buybunldelistnormallogo,
                    height: 3.9.h, // Scale with Sizer
                    width: 3.9.h, // Scale with Sizer
                  ),
                  title: Text(
                    data,
                    style: TextStyle(
                      fontSize: 15.sp, // Scale with Sizer
                      fontWeight: FontWeight.bold,
                      color: colorblue,
                    ),
                  ),
                  subtitle: Text(
                    subData,
                    style: TextStyle(
                      fontSize: 13.sp, // Scale with Sizer
                      fontWeight: FontWeight.bold,
                      color: colorblue,
                    ),
                  ),
                  trailing: Text(
                    packageType,
                    style: TextStyle(
                      fontSize: 14.sp, // Scale with Sizer
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          color: Colors.orange,
                          size: 25.0,
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
                    const Spacer(),
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
