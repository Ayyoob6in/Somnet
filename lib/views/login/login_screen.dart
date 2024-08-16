import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:somenet/controller/provider/login/login_provider.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';

import 'package:somenet/views/login/widgets/first_section.dart';
import 'package:somenet/views/login/widgets/home_erms_and_condition.dart';
import 'package:somenet/views/login/widgets/language_selctor_widget.dart';
import 'package:somenet/views/login/widgets/phone_number_filed_widget.dart';
import 'package:somenet/views/login/widgets/signin_button_widget.dart';
import 'package:somenet/views/login/widgets/signup_link_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    final loginState = Provider.of<LoginState>(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              color: sBlack,
              image: const DecorationImage(
                image: AssetImage(
                  authbackgorundimage,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Image.asset(authbackgorundimage),
          ),
          // Foreground content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const LoginScreenFirstSection(), // Custom widget for the first section
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildLanguageSelector(loginState, screenWidth, context),
                      buildPhoneNumberField(loginState, screenWidth, context),
                      buildTermsAndConditions(loginState, screenWidth, context),
                      SizedBox(height: screenHeight * 0.02),
                      buildSignInButton(context, screenWidth, loginState),
                      SizedBox(height: screenHeight * 0.03),
                      buildSignUpLink(screenWidth, context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Your build methods (like _buildLanguageSelector, _buildPhoneNumberField, etc.)
}
