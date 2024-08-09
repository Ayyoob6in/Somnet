import 'package:flutter/material.dart';
import 'package:somenet/utils/constants/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController phoneController;

  const CustomTextField({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
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
