import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';
import 'package:somenet/views/divider/widgets/build_drawer_item.dart';

Widget buildCustomDrawer({
  required BuildContext context,
  required void Function(int) onTap,
}) {
  return Drawer(
    child: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(drawerBackgoundImage), fit: BoxFit.fill)),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w), // Adjusted padding
            child: Row(
              children: [
                CircleAvatar(
                  maxRadius: 20.sp,
                  backgroundImage: const AssetImage(profileimage),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  // Added Expanded to prevent overflow
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Muhsin Vivacom",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 1.5.h,
                        ),
                        overflow: TextOverflow.ellipsis, // Handles overflow
                      ),
                      SizedBox(
                          height: 0.5.h), // Add some space between text and row
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: colorblue,
                            child: Icon(
                              Icons.phone,
                              size: 1.h,
                              color: sWhite,
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Expanded(
                            // Added Expanded to prevent overflow
                            child: Text(
                              "918787878",
                              style: TextStyle(
                                fontSize: 1.2.h,
                                color: colorblue,
                              ),
                              overflow:
                                  TextOverflow.ellipsis, // Handles overflow
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          buildDrawerItem(
            image: drawehomeIcon,
            title: 'Home',
            onTap: () {
              Navigator.pop(context);
              onTap(0);
            },
          ),
          buildDrawerItem(
            image: drawerprofileIcon,
            title: 'My Profile',
            onTap: () {
              // Navigate to Profile or perform other actions
            },
          ),
          buildDrawerItem(
            image: drawemyaccounticon,
            title: 'My Account',
            onTap: () {
              // Navigate to Settings or perform other actions
            },
          ),
          buildDrawerItem(
            image: drawerinviteIcon,
            title: 'Invite a Friend',
            onTap: () {
              // Perform logout action
            },
          ),
          buildDrawerItem(
            image: drawelanguageIcon,
            title: 'Language',
            onTap: () {
              // Perform logout action
            },
          ),
          buildDrawerItem(
            image: drawerinfoicon,
            title: 'Info',
            onTap: () {
              // Perform logout action
            },
          ),
          buildDrawerItem(
            image: drawerlogouticon,
            title: 'Logout',
            onTap: () {
              // Perform logout action
            },
          ),
        ],
      ),
    ),
  );
}

  


  // Helper method to build drawer items// Helper method to build drawer items
