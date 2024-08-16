// ignore_for_file: unused_element, unrelated_type_equality_checks

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:somenet/utils/helper/helper.dart';
import 'package:somenet/utils/images/images.dart';
import 'package:somenet/views/login/login_screen.dart';
import 'package:somenet/views/navbar/bottom_navbar.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  bool _isSignedIn = false;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool _isSnackbarActive = false;
  OverlayEntry? _snackbarEntry;

  @override
  void initState() {
    super.initState();
    checkConnectivityAndProceed();
    _proceedToNextScreen();
    // _connectivitySubscription =
    //     Connectivity().onConnectivityChanged.listen(_updateConnectivityStatus);
  }

  Future<void> checkConnectivityAndProceed() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      _showNoInternetSnackbar();
    } else {
      await _proceedToNextScreen();
    }
  }

  void _updateConnectivityStatus(ConnectivityResult result) async {
    if (result != ConnectivityResult.none) {
      if (_isSnackbarActive) {
        // Dismiss the snackbar if connectivity is restored
        _snackbarEntry?.remove();
        _isSnackbarActive = false;
        Navigator.of(context).pop(); // Close any previous page if needed
        await _proceedToNextScreen();
      }
    } else {
      _showNoInternetSnackbar();
    }
  }

  Future<void> _proceedToNextScreen() async {
    await getUserLoggedInStatus();
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              _isSignedIn ? const BottomNavbar() : const LoginScreen()));
    });
  }

  void _showNoInternetSnackbar() {
    if (!_isSnackbarActive) {
      _isSnackbarActive = true;

      final overlay = Overlay.of(context);
      _snackbarEntry = OverlayEntry(
        builder: (context) => Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              color: Colors.redAccent,
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "No Internet Connection. Please connect to the internet.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      _snackbarEntry?.remove();
                      _isSnackbarActive = false;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      overlay.insert(_snackbarEntry!);
    }
  }

  Future<void> getUserLoggedInStatus() async {
    await HelperFunction.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    if (_isSnackbarActive) {
      _snackbarEntry?.remove();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors
          .white, // Replace with appBackgroundcolor if you have a color constant
      body: Center(
          child: Image.asset(
        applogo,
        height: 10.h,
      )),
    );
  }
}
