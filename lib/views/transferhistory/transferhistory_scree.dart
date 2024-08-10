import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/views/transferhistory/widgets/transfer_historycard.dart';

class TransferhistoryScreen extends StatelessWidget {
  const TransferhistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        backgroundColor: sWhite,
        title: Text(
          "Transfer History",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.spa),
        ),
      ),
      body: ListView.builder(
          itemCount: 15,
          shrinkWrap: true,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            return const TransferHistorycard();
          }),
    );
  }
}
