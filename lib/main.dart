import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart'; // Import Sizer package
import 'package:somenet/controller/provider/createticket/create_ticket_prrovider.dart';
import 'package:somenet/controller/provider/estatement/estatement_provider.dart';
import 'package:somenet/controller/provider/home/home_provider.dart';
import 'package:somenet/controller/provider/login/login_provider.dart';
import 'package:somenet/controller/provider/userprofile/user_profile.dart';
import 'package:somenet/utils/constants/colors/colors.dart';
import 'package:somenet/views/login/login_screen.dart';

// Main entry point of the application
void main() {
  // Run the app with multiple providers
  runApp(
    MultiProvider(
      // List of providers to be used in the app
      providers: [
        // Provider for login state
        ChangeNotifierProvider(create: (context) => LoginState()),
        // Provider for home state
        ChangeNotifierProvider(create: (context) => HomeState()),

        ChangeNotifierProvider(create: (context) => EstatementState()),
        ChangeNotifierProvider(create: (context) => UserProfileProvider()),
        ChangeNotifierProvider(create: (context) => CreateTicketProvider())
      ],
      // Child widget of the providers
      child: const MyApp(),
    ),
  );
}

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // Build method to create the widget tree
  Widget build(BuildContext context) {
    // Use ResponsiveSizer to make the app responsive
    return ResponsiveSizer(
      // Builder method to create the MaterialApp
      builder: (context, orientation, deviceType) {
        // Create the MaterialApp
        return MaterialApp(
          // Title of the app
          title: 'Some',
          // Theme of the app
          theme: ThemeData(
            // Color scheme of the app
            colorScheme: ColorScheme.fromSeed(seedColor: appBackgroundColor),
            // Use Material 3 design
            useMaterial3: true,
            // Text theme of the app
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          ),
          // Home screen of the app
          home: const LoginScreen(),
        );
      },
    );
  }
}
