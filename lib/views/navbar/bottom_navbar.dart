import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/views/estatement/estatement_screen.dart';
import 'package:somenet/views/home/home_screen.dart';
import 'package:somenet/views/selfsupport/self_support_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  BottomNavbarState createState() => BottomNavbarState();
}

class BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  // Define the list of pages
  final List<Widget> _pages = [
    const HomeScreen(),
    EStatementScreen(),
    SelfSupportScreen(),
    const Center(
      child: Text("Page 4"),
    ),
    const Center(
      child: Text("Page 5"),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Center(
        child: _pages[_selectedIndex], // Display the selected page
      ),
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
    );
  }
}
