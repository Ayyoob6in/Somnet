import 'package:flutter/material.dart';
import 'package:somenet/l10n/app_localizations.dart';
import 'package:somenet/utils/constants/colors/colors.dart';

Widget buildSignUpLink(double screenWidth, BuildContext context) {
  return Center(
    child: GestureDetector(
      onTap: () {},
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: AppLocalizations.of(context).dontHaveAnAccount,
              style: TextStyle(
                color: sBlack,
                fontSize: screenWidth * 0.035,
              ),
            ),
            TextSpan(
              text: AppLocalizations.of(context).signUp,
              style: TextStyle(
                color: colorblue,
                fontSize: screenWidth * 0.035,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
