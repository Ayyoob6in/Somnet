import 'package:flutter/material.dart';
import 'package:somenet/utils/constants/colors/colors.dart';

class TransferHistorycard extends StatelessWidget {
  const TransferHistorycard({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive design
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: sWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            screenWidth * 0.03), // Responsive border radius
      ),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Icon(
                  Icons.radio_button_unchecked,
                  color: colorblue,
                  size: screenWidth * 0.06, // Responsive icon size
                ),
                SizedBox(
                  height: screenWidth * 0.06, // Responsive height
                  child: const VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                ),
                Icon(
                  Icons.radio_button_checked,
                  color: colorblue,
                  size: screenWidth * 0.06, // Responsive icon size
                ),
              ],
            ),
            SizedBox(width: screenWidth * 0.03), // Responsive spacing
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '+252615209444',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045, // Responsive font size
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.05), // Responsive spacing
                  Text(
                    '+252611642537',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045, // Responsive font size
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02), // Responsive spacing
                  Text(
                    'Transfer Success',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03, // Responsive font size
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '20-04-2021 14:50',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035, // Responsive font size
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: screenWidth * 0.08), // Responsive spacing
                Text(
                  '300 MB',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045, // Responsive font size
                    fontWeight: FontWeight.w500,
                    color: colorblue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
