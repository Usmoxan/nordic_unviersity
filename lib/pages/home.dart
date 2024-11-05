import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nordic_unviersity/pages/aboutpage.dart';
import 'package:nordic_unviersity/pages/adabiyotlar.dart';
import 'package:nordic_unviersity/pages/pdfreader.dart';
import 'package:nordic_unviersity/pages/topshiriqlar.dart';

import 'mavzular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF087268),
        title: Row(
          children: [
            // University Logo (Placeholder for the logo)
            Image.asset(
              "assets/logo_2x.png",
              height: 40,
            ),
            const SizedBox(width: 10), // Spacing between logo and text
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const Aboutpage(),
              //   ),
              // );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Spacer(),
          GridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.all(25.0),
            crossAxisCount: 2,
            crossAxisSpacing: 25.0,
            mainAxisSpacing: 25.0,
            children: <Widget>[
              _buildGridItem('assets/icon3.png', 'Sillabus', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PdfReaderPage(
                      filePath: 'assets/files/sillabus.pdf',
                      title: 'Sillabus',
                    ),
                  ),
                );
              }),
              _buildGridItem('assets/icon2.png', 'Mavzular', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MavzularPage()));
              }),
              _buildGridItem('assets/icon4.png', 'Topshiriqlar', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TopshiriqlarPage()));
              }),
              _buildGridItem('assets/icon1.png', 'Adabiyotlar va havolalar',
                  () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdabiyotlarPage()));
              }),
            ],
          ),
          const Spacer(),
          const Text(
            "XALQARO NORDIK UNIVERSITETI",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFF087268),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildGridItem(String imgname, String label, VoidCallback onClickedd) {
    return GestureDetector(
      onTap: onClickedd,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              imgname,
              width: 70,
            ),
            const SizedBox(height: 10),
            Text(label,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
