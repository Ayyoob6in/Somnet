import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/l10n/app_localizations.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';

class LoginScreenFirstSection extends StatelessWidget {
  const LoginScreenFirstSection({super.key}); // Example color

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(color: appBackgroundColor),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(applogo, height: 10.h),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 16.0), // Add padding if needed
              child: Text(
                AppLocalizations.of(context).login,
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
