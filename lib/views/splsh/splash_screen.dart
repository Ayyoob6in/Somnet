import 'package:flutter/material.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/utils/images/images.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScreenSplashState createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: appBackgroundColor),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  applogo,
                  height: 150,
                  width: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
