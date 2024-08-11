import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/views/pinpuk/widgets/pinpuk_card_widget.dart';
import 'package:somenet/views/widgets/custom_alert_dilogue.dart';
import 'package:somenet/views/widgets/custom_button_widget.dart';

class PinPukScreen extends StatelessWidget {
  const PinPukScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        backgroundColor: sWhite,
        title: Text(
          "PIN/PUK Code",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 2.h, // Responsive font size
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 4.h), // Add some spacing before the card
          pinpukCard(
              firstTitle: "PIN Code 1",
              secondTitle: "PIN Code 2",
              codeone: "1234",
              codetwo: "23455"),
          SizedBox(height: 2.h), // Add some spacing before the card
          pinpukCard(
              firstTitle: "PUK Code 1",
              secondTitle: "PUK Code 2",
              codeone: "81407340",
              codetwo: "81407340"),
          SizedBox(height: 2.h),
          customButton(
              context: context,
              onPress: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return customAlertDialog(
                          context: context,
                          title:
                              "Please enter the number you want to get a PIN/PUK code for",
                          textfieldtext: "+25627");
                    });
              },
              text:
                  "Get a PIN/PUK Code for another number") // Add some spacing before the card
        ],
      ),
    );
  }
}
