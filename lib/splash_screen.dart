import 'package:flutter/material.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // TODO: Navigate to Login Screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using a soft pink color similar to the reference image
      backgroundColor: const Color(0xFFFFC0CB), 
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 200, // Adjust width as needed
          height: 200,
        ),
      ),
    );
  }
}
