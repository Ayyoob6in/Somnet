import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart'; // Import Sizer package
import 'package:somenet/controller/provider/home/home_provider.dart';
import 'package:somenet/controller/provider/login/login_provider.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/views/login/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginState()),
        ChangeNotifierProvider(create: (context) => HomeState()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      // Wrap the MaterialApp with Sizer for responsiveness
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Some',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: appBackgroundColor),
            useMaterial3: true,
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          ),
          home: const LoginScreen(),
        );
      },
    );
  }
}
