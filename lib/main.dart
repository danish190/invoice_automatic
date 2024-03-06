import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_automatic/screeens/login_screen.dart';
import 'package:invoice_automatic/utils/preferences.dart';


void main() {
 
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  

  @override
  void initState() {
  
    Preferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const LoginScreen(),
      // ClientInfoPage(title: 'Client Info'),

      //     WelcomeScreen(
      //   title: 'Home',
      // ),
    );
  }
}
