import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:somenet/controller/provider/login/login_provider.dart';
import 'package:somenet/l10n/app_localizations.dart';
import 'package:somenet/utils/constants/colors/colors.dart';

Widget buildLanguageSelector(
    LoginState loginState, double screenWidth, BuildContext context) {
  return Column(
    children: [
      SizedBox(height: screenWidth * 0.05), // Responsive spacing
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.g_translate_outlined, color: colorblue, size: 17),
          SizedBox(width: screenWidth * 0.02), // Responsive spacing
          Text(
            AppLocalizations.of(context).language,
            style: TextStyle(fontSize: screenWidth * 0.03, color: sGrey),
          ),
        ],
      ),
      SizedBox(height: screenWidth * 0.02), // Responsive spacing
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context).english,
            style: TextStyle(
              color: loginState.isEnglishSelected ? colorblue : sGrey,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.035,
            ),
          ),
          SizedBox(width: screenWidth * 0.02), // Responsive spacing
          CupertinoSwitch(
            value: !loginState.isEnglishSelected,
            onChanged: (value) {
              loginState.toggleLanguage();
            },
            activeColor: colorblue,
          ),
          SizedBox(width: screenWidth * 0.02), // Responsive spacing
          Text(
            AppLocalizations.of(context).somali,
            style: TextStyle(
              color: !loginState.isEnglishSelected ? colorblue : sGrey,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.035,
            ),
          ),
        ],
      ),
      SizedBox(height: screenWidth * 0.02), // Responsive spacing
    ],
  );
}
