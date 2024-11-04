import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nordic_unviersity/pages/adabiyotlar.dart';
import 'package:nordic_unviersity/pages/pdfreader.dart';
import 'package:nordic_unviersity/pages/topshiriqlar.dart';

import 'mavzular.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF087268),
        title: const Text("Ma'lumot"),
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
              _buildGridItem(
                  'assets/man_icon.png', 'Xamidova Zulfiya Axmadjonovna', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PdfReaderPage(
                      filePath: 'assets/about_1.pdf',
                      title: 'Xamidova Zulfiya Axmadjonovna',
                    ),
                  ),
                );
              }),
              _buildGridItem('assets/man_icon.png', 'Sobirov Xasan Nusratovich',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PdfReaderPage(
                      filePath: 'assets/about_2.pdf',
                      title: 'Sobirov Xasan Nusratovich',
                    ),
                  ),
                );
              }),
              _buildGridItem(
                  'assets/man_icon.png', 'Hamidova Asilabonu Husanovna', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PdfReaderPage(
                      filePath: 'assets/about_3.pdf',
                      title: 'Hamidova Asilabonu Husanovna',
                    ),
                  ),
                );
              }),
              _buildGridItem('assets/man_icon.png',
                  'Tolibjonov Xurshidbek Hayotjon o\'g\'li', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PdfReaderPage(
                      filePath: 'assets/about_4.pdf',
                      title: 'Tolibjonov Xurshidbek Hayotjon o\'g\'li',
                    ),
                  ),
                );
              }),
            ],
          ),
          const Spacer(),
          const Text(
            "XALQARO NORDIK UNIVERSITETI",
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
