import 'package:flutter/material.dart';
import 'package:somenet/views/buybundle/widgets/packages_card.dart';

class NormalPackages extends StatelessWidget {
  const NormalPackages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Colors.lightBlue[50], // Background similar to the image
        body: ListView.builder(
            itemCount: 15,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return PackageCardNormal(
                data: '250 MB',
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
