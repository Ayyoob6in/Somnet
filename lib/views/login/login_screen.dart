import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:somenet/controller/provider/login/login_provider.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';
import 'package:somenet/views/login/widgets/custom_textfield.dart';
import 'package:somenet/views/login/widgets/first_section.dart';
import 'package:somenet/views/otp/otp_screen.dart';

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
              image: DecorationImage(
                image: AssetImage(authbackgorundimage),
                fit: BoxFit.cover, // Ensures the image covers the entire screen
              ),
            ),
          ),

          // Foreground content
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LoginScreenFirstSection(),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.all(screenWidth * 0.05), // Responsive padding
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
                      _buildLanguageSelector(loginState, screenWidth),
                      _buildPhoneNumberField(loginState, screenWidth),
                      _buildTermsAndConditions(loginState, screenWidth),
                      SizedBox(
                          height: screenHeight * 0.02), // Responsive spacing
                      _buildSignInButton(context, screenWidth),
                      SizedBox(
                          height: screenHeight * 0.03), // Responsive spacing
                      _buildSignUpLink(screenWidth),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Your build methods (like _buildLanguageSelector, _buildPhoneNumberField, etc.)

  Widget _buildLanguageSelector(LoginState loginState, double screenWidth) {
    return Column(
      children: [
        SizedBox(height: screenWidth * 0.05), // Responsive spacing
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.g_translate_outlined, color: colorblue, size: 17),
            SizedBox(width: screenWidth * 0.02), // Responsive spacing
            Text(
              'Language',
              style: TextStyle(fontSize: screenWidth * 0.03, color: sGrey),
            ),
          ],
        ),
        SizedBox(height: screenWidth * 0.02), // Responsive spacing
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'English',
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
              'Somali',
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

  Widget _buildPhoneNumberField(LoginState loginState, double screenWidth) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.phone, color: colorblue, size: 18),
            SizedBox(width: screenWidth * 0.05), // Responsive spacing
            Text(
              'Phone Number',
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

  Widget _buildTermsAndConditions(LoginState loginState, double screenWidth) {
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
          'I accept ',
          style: TextStyle(fontSize: screenWidth * 0.035),
        ),
        GestureDetector(
          onTap: () {
            // Handle terms and conditions
          },
          child: Text(
            'Terms and Conditions',
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

  Widget _buildSignInButton(BuildContext context, double screenWidth) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shadowColor: sGrey,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.04), // Responsive padding
      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const OTPScreen()));
      },
      child: Center(
        child: Text(
          'Sign In',
          style: TextStyle(fontSize: screenWidth * 0.04, color: sWhite),
        ),
      ),
    );
  }

  Widget _buildSignUpLink(double screenWidth) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Don\'t have an account? ',
                style: TextStyle(
                  color: sBlack,
                  fontSize: screenWidth * 0.035,
                ),
              ),
              TextSpan(
                text: 'Sign Up',
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
}
