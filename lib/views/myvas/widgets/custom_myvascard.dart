import 'package:flutter/material.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';

class CustomMyvascard extends StatelessWidget {
  const CustomMyvascard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: sWhite,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(myvasListIcon),
                    const SizedBox(width: 8),
                    const Text(
                      'Fariin-Wadaag',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Switch(
                  value: true, // Example toggle state
                  onChanged: (bool value) {},
                  activeColor: colorblue,
                  inactiveThumbColor: sBlack,
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Fariin-Wadaag a chatting application that allows users to chat via private and public groups ...',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '\$0.0166 / day',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
