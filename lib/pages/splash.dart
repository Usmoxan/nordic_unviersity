import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nordic_unviersity/pages/home.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF296BCF),
      body: Center(
        child: SizedBox(
            width: 300,
            height: 150,
            child: Image.asset("assets/logo_2x.png")),
      ),
    );
  }
}