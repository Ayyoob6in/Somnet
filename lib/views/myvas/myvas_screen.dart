import 'package:flutter/material.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/views/myvas/widgets/custom_myvascard.dart';

class MyvasScreen extends StatelessWidget {
  const MyvasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        backgroundColor: sWhite,
        title: const Text(
          "My VAS",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: ListView.builder(
          itemCount: 15,
          shrinkWrap: true,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            return const CustomMyvascard();
          }),
    );
  }
}
