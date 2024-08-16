import 'package:flutter/material.dart';
import 'package:somenet/controller/provider/login/login_provider.dart';
import 'package:somenet/l10n/app_localizations.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/views/login/widgets/custom_textfield.dart';

Widget buildPhoneNumberField(
    LoginState loginState, double screenWidth, BuildContext context) {
  return Column(
    children: [
      Row(
        children: [
          Icon(Icons.phone, color: colorblue, size: 18),
          SizedBox(width: screenWidth * 0.05), // Responsive spacing

          Text(
            AppLocalizations.of(context).phoneNumber,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: sGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      SizedBox(height: screenWidth * 0.02), // Responsive spacing
      CustomTextField(
        phoneController: loginState.phoneController,
      ),
    ],
  );
}
