import 'package:flutter/material.dart';
import 'package:somenet/controller/provider/login/login_provider.dart';
import 'package:somenet/l10n/app_localizations.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/views/otp/otp_screen.dart';

Widget buildSignInButton(
  BuildContext context,
  double screenWidth,
  LoginState loginState,
) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: buttonColor,
      shadowColor: sGrey,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(
        vertical: screenWidth * 0.04,
      ),
    ),
    onPressed: () async {
      final phoneNumber = loginState.phoneController.text;
      final phoneNumberError =
          loginState.validatePhoneNumberFormat(phoneNumber);

      if (phoneNumberError != null) {
        _showErrorSnackbar(context, phoneNumberError);
        return;
      }

      if (loginState.isTermsAccepted) {
        if (loginState.isLoading) return; // Prevent multiple submissions

        await loginState.validatePhoneNumber(phoneNumber);

        if (loginState.loginPhoneNumberStatus?.result == 'okay' ||
            loginState.loginPhoneNumberStatus?.data == '*406#') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OTPScreen(
                      phonenumber: loginState.phoneController.text,
                    )),
          );
        } else if (loginState.errorMessage != null) {
          _showErrorSnackbar(context, loginState.errorMessage!);
        }
      } else {
        _showErrorSnackbar(
          context,
          'You must accept the terms and conditions to proceed.',
        );
      }
    },
    child: loginState.isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: sWhite,
              strokeWidth: 2, // Adjust thickness as needed
            ),
          )
        : Center(
            child: Text(
              AppLocalizations.of(context).signIn,
              style: TextStyle(fontSize: screenWidth * 0.04, color: sWhite),
            ),
          ),
  );
}

void _showErrorSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3), // Adjust duration as needed
    ),
  );
}

void _showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Error'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
