import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:somenet/controller/provider/otp/otp_provider.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';

import 'package:somenet/views/otp/widgets/otp_widgets.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key, required this.phonenumber});
  final String? phonenumber;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final padding = EdgeInsets.symmetric(horizontal: screenWidth * 0.05);

    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Consumer<OtpProvider>(
        builder: (context, otpProvider, child) {
          return Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLogoAndInfo(screenHeight, screenWidth, padding),
                    SizedBox(height: screenHeight * 0.03),
                    buildOTPContainer(screenWidth, screenHeight, padding,
                        context, otpProvider, phonenumber.toString()),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLogoAndInfo(
      double screenHeight, double screenWidth, EdgeInsets padding) {
    return SizedBox(
      height: screenHeight * 0.68,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: screenHeight * 0.1,
              child: Image.asset(applogo),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          Padding(
            padding: padding,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
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
}
