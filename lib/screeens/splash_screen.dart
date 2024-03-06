import 'dart:async';
import 'package:flutter/material.dart';
import 'package:invoice_automatic/screeens/language_screen.dart';
import 'package:invoice_automatic/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SelectLanguage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: mainColor,
        image: DecorationImage(
          image: AssetImage('assets/logo2.png'),
          alignment: Alignment.bottomRight,
        ),
      ),
      //   color: mainColor,
      child: Image.asset(
        'assets/logo.png',
      ),
    );
  }
}
