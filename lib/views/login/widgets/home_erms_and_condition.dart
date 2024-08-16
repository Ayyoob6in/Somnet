import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/controller/provider/login/login_provider.dart';
import 'package:somenet/l10n/app_localizations.dart';
import 'package:somenet/utils/constants/colors/colors.dart';

Widget buildTermsAndConditions(
    LoginState loginState, double screenWidth, BuildContext context) {
  return Row(
    children: [
      Checkbox(
        value: loginState.isTermsAccepted,
        onChanged: (value) {
          loginState.toggleTermsAccepted(value!);
        },
        activeColor: colorblue,
      ),
      Text(
        AppLocalizations.of(context).iAccept,
        style: TextStyle(fontSize: screenWidth * 0.030),
      ),
      SizedBox(
        width: 1.w,
      ),
      GestureDetector(
        onTap: () {
          // Handle terms and conditions
        },
        child: Text(
          AppLocalizations.of(context).termsAndConditions,
          style: TextStyle(
            color: colorblue,
            fontWeight: FontWeight.w500,
            fontSize: screenWidth * 0.035,
          ),
        ),
      ),
    ],
  );
}
