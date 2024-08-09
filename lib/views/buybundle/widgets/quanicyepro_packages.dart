import 'package:flutter/material.dart';
import 'package:somenet/views/buybundle/widgets/packages_card_quanciyepro.dart';

class QuanicyeproPackages extends StatelessWidget {
  const QuanicyeproPackages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Colors.lightBlue[50], // Background similar to the image
        body: ListView.builder(
            itemCount: 15,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return PackageCardNormalQuanciyePro(
                data: '4.5 GB +',
                subData: "104 Min + 26 SMS",
                packageType: 'Normal Package',
                duration: 'Daily',
                price: '\$0.25',
                onTap: () {
                  // Handle tap
                },
              );
            }));
  }
}
