import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/features/pages/login_screen.dart';

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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/features/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset(
            "lib/features/images/logo.png",
            height: 250,
            width: 250,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
