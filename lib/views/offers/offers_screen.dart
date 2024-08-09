import 'package:flutter/material.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/views/buybundle/widgets/packages_card_quanciyepro.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: sWhite,
          title: const Text(
            "Offers",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        body: ListView.builder(
            itemCount: 15,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return PackageCardNormalQuanciyePro(
                data: '4.5 GB +',
                subData: "104 Min + 26 SMS",
                packageType: 'Normal Package',
                duration: '7 Days',
                price: '\$0.25',
                onTap: () {
                  // Handle tap
                },
              );
            }));
  }
}
