import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';
import 'package:somenet/views/navbar/bottom_navbar.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final padding = EdgeInsets.symmetric(horizontal: screenWidth * 0.05);

    return Scaffold(
      backgroundColor:
          appBackgroundColor, // Set background color for the Scaffold
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogoAndInfo(screenHeight, screenWidth, padding),
            SizedBox(height: screenHeight * 0.03), // Adjust spacing
            _buildOTPContainer(screenWidth, screenHeight, padding, context),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoAndInfo(
      double screenHeight, double screenWidth, EdgeInsets padding) {
    return SizedBox(
      height: screenHeight * 0.68, // Adjust height based on screen size
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: screenHeight * 0.1, // Logo height
              child:
                  Image.asset(applogo), // Replace with actual logo URL or asset
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          Padding(
            padding: padding,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: screenWidth * 0.03, // Responsive font size
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: 'Verification Code\n',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w300,
                      color: colorblue,
                    ),
                  ),
                  TextSpan(
                    text:
                        'We have sent a confirmation code to your mobile number.  '
                        'It may take a few minutes to deliver it. If you want you may ',
                    style: GoogleFonts.montserrat(),
                  ),
                  const TextSpan(
                    text: '*406#',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' immediately.',
                    style: GoogleFonts.montserrat(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOTPContainer(double screenWidth, double screenHeight,
      EdgeInsets padding, BuildContext context) {
    return Container(
      padding: padding,
      decoration: const BoxDecoration(
        color: Colors.white, // Background color of the container
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ), // Rounded corners
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight * 0.03), // Adjust spacing
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Enter Code',
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02), // Adjust spacing

          // OTP input fields using pin_code_fields
          PinCodeTextField(
            length: 4,
            onChanged: (value) {
              // Handle OTP input
            },
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(10),
              fieldHeight: screenHeight * 0.07,
              fieldWidth: screenWidth * 0.12,
              activeFillColor:
                  textfieldfilled, // Background color of the OTP input fields
              inactiveFillColor:
                  textfieldfilled, // Background color of the OTP input fields
              selectedFillColor:
                  textfieldfilled, // Background color of the OTP input fields
              activeColor: colorblue, // Border color when active
              inactiveColor: colorblue, // Border color when inactive
              selectedColor: colorblue, // Border color when selected
              borderWidth: 2.0, // Width of the border
            ),
            cursorColor: Colors.black87,
            keyboardType: TextInputType.number,
            appContext: context,
          ),
          SizedBox(height: screenHeight * 0.01), // Adjust spacing

          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BottomNavbar()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              minimumSize: Size(double.infinity, screenHeight * 0.07),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Confirm',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: sWhite,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02), // Adjust spacing

          GestureDetector(
            onTap: () {
              // Handle resend OTP action
            },
            child: Text(
              'Resend OTP',
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                color: Colors.blue,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
