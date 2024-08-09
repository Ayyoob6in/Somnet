import 'package:flutter/material.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/constants/size/height.dart';

/// Builds the top user information section of the home screen.
///
/// This section includes a blue background container with balance information,
/// and three overlapping info cards displaying internet, voice, and message data.
///
/// Parameters:
///   screenWidth (double): The width of the screen to adjust the card width accordingly.
///
/// Returns:
///   A [Widget] representing the top user information section.
Widget buildTopUserInfoSection(double screenWidth) {
  return Stack(
    children: [
      // Placeholder for overall container
      Container(height: 240),
      // Background Blue Container
      Container(
        padding: const EdgeInsets.all(16),
        height: 150,
        decoration: BoxDecoration(
          color: colorblue,
        ),
        child: _buildBalanceInfo(),
      ),
      // Info Cards (Overlapping)
      Positioned(
        top: 100,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildInfoCard('12.54 GB', 'Internet', Icons.public, screenWidth),
            _buildInfoCard('350 Min', 'Voice', Icons.call, screenWidth),
            _buildInfoCard('500 SMS', 'Message', Icons.message, screenWidth),
          ],
        ),
      ),
    ],
  );
}

/// Builds an info card widget with a gradient background, icon, amount, and label.
///
/// Parameters:
///   amount (String): The amount to be displayed on the card.
///   label (String): The label to be displayed on the card.
///   icon (IconData): The icon to be displayed on the card.
///   screenWidth (double): The screen width to adjust the card width accordingly.
///
/// Returns:
///   Widget: The built info card widget.
Widget _buildInfoCard(
    String amount, String label, IconData icon, double screenWidth) {
  return Container(
    padding: const EdgeInsets.all(12),
    width: screenWidth < 600 ? 100 : 120, // Adjust width based on screen size
    height: 135,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF279AD2), // #279AD2
                    Color(0xFF52BBE8), // #52BBE8
                  ],
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: sWhite, size: 24)),
        const SizedBox(height: 8),
        Text(
          amount,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        sh10,
        Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/images/Rectangle 134.png",
              fit: BoxFit.cover,
            ))
      ],
    ),
  );
}

// Builds the balance information widget with the current balance amount and remaining days.
Widget _buildBalanceInfo() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$230.00',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '25 days remaining',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () {
              // Handle recharge button tap
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: Icon(Icons.bolt, color: colorblue),
            label: Text(
              'Recharge',
              style: TextStyle(color: colorblue),
            ),
          ),
        ],
      ),
    ],
  );
}
