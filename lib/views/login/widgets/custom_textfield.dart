import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for TextInputFormatter
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController phoneController;

  const CustomTextField({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: sBlack, fontSize: 2.h),
      controller: phoneController,
      keyboardType: TextInputType.number, // Changed to number to restrict input
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // Allow only digits
        LengthLimitingTextInputFormatter(9), // Limit input to 9 characters
      ],
      decoration: InputDecoration(
        fillColor: textfieldfilled,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: sWhite, // Border color
            width: 2.0, // Border width
          ),
        ),
        prefix: const Text("+252"),
        prefixStyle: TextStyle(color: sBlack, fontSize: 2.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: sWhite, // Border color
            width: 2.0, // Border width
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: sWhite, // Border color
            width: 2.0, // Border width
          ),
        ),
      ),
    );
  }
}
