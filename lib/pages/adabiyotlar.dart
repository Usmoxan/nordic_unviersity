import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nordic_unviersity/pages/pdfreader.dart';

class AdabiyotlarPage extends StatefulWidget {
  const AdabiyotlarPage({super.key});

  @override
  State<AdabiyotlarPage> createState() => _AdabiyotlarPageState();
}

class _AdabiyotlarPageState extends State<AdabiyotlarPage> {
  final List<Map<String, String>> presentations = [
    {
      "title": "Aaaa",
      "path": "assets/files/Iqtisodiyot nazariyasi (A.O'lmasov, M.Sharifxo'jayev).pdf"
    },
    {
      "title": "2-LOYIHA ISHI-IQTISODIYOTGA KIRISH",
      "path": "assets/files/topshiriq2.pdf"
    },
    {
      "title": "IQTISODIYOTGA KIRISH - YAKUNIY NAZORAT TESTI",
      "path": "assets/files/topshiriq3.pdf"
    },
    {
      "title":
          "IQTISODIYOTGA KIRISH-ORALIQ NAZORAT BO`YICHA TEST SAVOLLARI-2023-2024",
      "path": "assets/files/topshiriq4.pdf"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF296BCF),
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Adabiyotlar va havolalar",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: presentations.length,
        itemBuilder: (context, index) {
          return ListViewWidget(
            title: presentations[index]['title']!,
            onClicked: () {
              final path = presentations[index]['path']!;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfReaderPage(
                    filePath: path,
                    title: presentations[index]['title']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  final String title;
  final VoidCallback onClicked;
  const ListViewWidget({
    super.key,
    required this.title,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: const Color(0xFFCBCBCB),
                  borderRadius: BorderRadius.circular(60)),
              child: const Center(child: Icon(Icons.chevron_right)),
            )
          ],
        ),
      ),
    );
  }
}