import 'package:flutter/material.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/views/buybundle/bundlebuy.dart';
import 'package:somenet/views/myvas/myvas_screen.dart';
import 'package:somenet/views/offers/offers_screen.dart';
import 'package:somenet/views/transferhistory/transferhistory_scree.dart';

Widget buildQuickShortcutSection(double screenWidth, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Quick Shortcut',
          style: TextStyle(
            fontSize: 16,
            color: colorblue.withOpacity(0.4),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      GridView(
        padding: const EdgeInsets.all(18),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              screenWidth < 600 ? 2 : 4, // Adjust based on screen width
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: screenWidth < 600 ? 2.2 : 3.0,
        ),
        children: [
          _buildShortcutCard('Buy Bundle', Icons.shopping_bag, () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BuybundleScreen()));
          }),
          _buildShortcutCard('Data Transfer', Icons.swap_horiz, () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TransferhistoryScreen()));
          }),
          _buildShortcutCard('Offers', Icons.card_giftcard, () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const OffersScreen()));
          }),
          _buildShortcutCard('My VAS', Icons.settings, () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MyvasScreen()));
          }),
        ],
      ),
    ],
  );
}

Widget _buildShortcutCard(String title, IconData icon, Function()? ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
          const SizedBox(width: 8),
          Text(
            title,
            overflow: TextOverflow.fade,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
