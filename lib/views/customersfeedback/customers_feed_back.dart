import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/views/customersfeedback/widgets/rating_form.dart';
import 'package:somenet/views/widgets/custom_button_widget.dart';

class CustomersFeedBAckScreen extends StatelessWidget {
  const CustomersFeedBAckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: sWhite,
        title: Text(
          "Buy Bundle",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp, // Responsive font size
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(child: RatingForm()),
            SizedBox(height: 1.h),
            customButton(
              onPress: () {},
              text: "Send Feedbacks",
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}
