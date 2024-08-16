import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/helper/helper.dart';
import 'package:somenet/utils/images/images.dart';
import 'package:somenet/utils/secure/secure_storage.dart';
import 'package:somenet/views/aboutus/aboutus_screen.dart';
import 'package:somenet/views/estatement/estatement_screen.dart';
import 'package:somenet/views/home/home_screen.dart';
import 'package:somenet/views/invite/invite_a_friend.dart';
import 'package:somenet/views/login/login_screen.dart';
import 'package:somenet/views/notification/notification_screen.dart';
import 'package:somenet/views/selfsupport/self_support_screen.dart';
import 'package:somenet/views/userprofile/user_profile_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  BottomNavbarState createState() => BottomNavbarState();
}

class BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  final _advancedDrawerController = AdvancedDrawerController();

  final List<Widget> _pages = [
    const HomeScreen(),
    const EStatementScreen(),
    const SelfSupportScreen(),
    const NotificationScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 4) {
      // Open the Advanced Drawer when the last icon is tapped
      _advancedDrawerController.showDrawer();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Widget _buildIcon(IconData iconData, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: _selectedIndex == index ? Colors.blue : Colors.grey,
        ),
        if (_selectedIndex == index)
          Container(
            width: 6.sw,
            height: 0.7.sh,
            margin: const EdgeInsets.only(top: 2),
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: _advancedDrawerController,
      rtlOpening: true, // Ensures the drawer opens from the right side
      animationDuration: const Duration(milliseconds: 300),
      animationCurve: Curves.easeInOut,
      openRatio: 0.15.w,
      backdrop: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(drawerBackgoundImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: buildCustomDrawer(context),
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        body: _pages[_selectedIndex], // Display the selected page
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.home_outlined, 0),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.file_copy_outlined, 1),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.person_outline, 2),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.notifications_none_outlined, 3),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.notes, 4),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCustomDrawer(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User profile section
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.all(10.sp),
            child: Row(
              children: [
                // Profile picture
                Container(
                  width: 45.0,
                  height: 45.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    profileimage,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 03.w),
                // Name and phone number
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Muhsin Vivacom', // Replace with dynamic name
                      style: TextStyle(
                        fontSize: 03.w,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.blue, size: 03.w),
                        SizedBox(width: 02.w),
                        Text(
                          '615 209444', // Replace with dynamic phone number
                          style: TextStyle(
                            fontSize: 03.w,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          // Drawer items
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading:
                CircleAvatar(radius: 02.h, child: Image.asset(drawehomeIcon)),
            title: const Text('Home', style: TextStyle(color: Colors.black)),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UserProfileScreen()));
            },
            leading: CircleAvatar(
                radius: 02.h, child: Image.asset(drawerprofileIcon)),
            title:
                const Text('My Profile', style: TextStyle(color: Colors.black)),
          ),

          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const InviteAFriendScreen()));
            },
            leading: CircleAvatar(
                radius: 02.h, child: Image.asset(drawerinviteIcon)),
            title: const Text('Invite a Friend',
                style: TextStyle(color: Colors.black)),
          ),
          ListTile(
            onTap: () {},
            leading: CircleAvatar(
                radius: 02.h, child: Image.asset(drawelanguageIcon)),
            title: const Text('English', style: TextStyle(color: Colors.black)),
            subtitle:
                const Text('Language', style: TextStyle(color: Colors.grey)),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AboutusScreen()));
            },
            leading:
                CircleAvatar(radius: 02.h, child: Image.asset(drawerinfoicon)),
            title:
                const Text('About Us', style: TextStyle(color: Colors.black)),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Confirm Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog

                          // Perform logout actions here
                          HelperFunction.deleteDataFromSf();
                          SecureStorage()
                            ..deleteAccessToken()
                            ..deleteRefreshToken();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  );
                },
              );
            },
            leading: CircleAvatar(
                radius: 02.h, child: Image.asset(drawerlogouticon)),
            title: const Text('Logout', style: TextStyle(color: Colors.black)),
          ),
          const Spacer(),

          const Spacer(),
        ],
      ),
    );
  }
}
