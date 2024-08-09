import 'package:flutter/material.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/views/buybundle/widgets/normal_packages.dart';
import 'package:somenet/views/buybundle/widgets/quanicyepro_packages.dart';

class BuybundleScreen extends StatelessWidget {
  const BuybundleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sWhite,
        title: const Text(
          "Buy Bundle",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: <Widget>[
            Container(
              color: sWhite,
              child: TabBar(
                labelColor: colorblue,
                unselectedLabelColor: Colors.lightBlue[100],
                indicatorColor: colorblue,
                dividerColor: sWhite,
                indicatorWeight: 3.0,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0,
                ),
                tabs: const [
                  Tab(text: "Normal"),
                  Tab(text: "Quanciye"),
                  Tab(text: "Quanciye Plus"),
                  Tab(text: "Maqsuud"),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: <Widget>[
                  NormalPackages(),
                  QuanicyeproPackages(),
                  Center(child: Text("Quanciye Plus Tab Content")),
                  Center(child: Text("Maqsuud Tab Content")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
