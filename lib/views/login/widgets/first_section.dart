import 'package:flutter/material.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';

class LoginScreenFirstSection extends StatelessWidget {
  const LoginScreenFirstSection({super.key}); // Example color

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      decoration: BoxDecoration(color: appBackgroundColor),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(applogo, height: 100),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 16.0), // Add padding if needed
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: colorblue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
