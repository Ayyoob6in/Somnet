import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:somenet/controller/provider/otp/otp_provider.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/views/navbar/bottom_navbar.dart';

Widget buildOTPContainer(
    double screenWidth,
    double screenHeight,
    EdgeInsets padding,
    BuildContext context,
    OtpProvider otpProvider,
    String phonenumber) {
  return Container(
    padding: padding,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
    ),
    width: double.infinity,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: screenHeight * 0.03),
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
        SizedBox(height: screenHeight * 0.02),

        // OTP input fields using pin_code_fields
        PinCodeTextField(
          length: 6,
          onChanged: (value) {
            otpProvider.otpCode = value;
          },
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(10),
            fieldHeight: screenHeight * 0.07,
            fieldWidth: screenWidth * 0.12,
            activeFillColor: textfieldfilled,
            inactiveFillColor: textfieldfilled,
            selectedFillColor: textfieldfilled,
            activeColor: colorblue,
            inactiveColor: colorblue,
            selectedColor: colorblue,
            borderWidth: 2.0,
          ),
          cursorColor: Colors.black87,
          keyboardType: TextInputType.number,
          appContext: context,
        ),
        SizedBox(height: screenHeight * 0.01),

        ElevatedButton(
          onPressed: () async {
            // Validate if OTP is entered
            if (otpProvider.otpCode.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter the OTP')),
              );
              return;
            }

            // Validate OTP
            String phoneNumber = phonenumber.toString();
            await otpProvider.validateOtp(
              phoneNumber,
              int.tryParse(otpProvider.otpCode) ?? 0,
            );

            // Handle validation results
            if (otpProvider.errorMessage != null) {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(otpProvider.errorMessage!)),
              );
            } else if (otpProvider.otpResponse?.result == 'ok') {
              // ignore: use_build_context_synchronously
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BottomNavbar(),
              ));
            } else if (otpProvider.otpResponse?.result == 'error') {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    otpProvider.otpResponse?.errorDesc ??
                        'An unknown error occurred',
                  ),
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            minimumSize: Size(double.infinity, screenHeight * 0.07),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: otpProvider.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: sWhite,
                ))
              : Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: sWhite,
                  ),
                ),
        ),

        SizedBox(height: screenHeight * 0.02),

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
