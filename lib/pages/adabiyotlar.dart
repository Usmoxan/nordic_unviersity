import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nordic_unviersity/pages/pdfreader.dart';
import 'package:nordic_unviersity/pages/webview.dart';

class AdabiyotlarPage extends StatefulWidget {
  const AdabiyotlarPage({super.key});

  @override
  State<AdabiyotlarPage> createState() => _AdabiyotlarPageState();
}

class _AdabiyotlarPageState extends State<AdabiyotlarPage> {
  final List<Map<String, String>> presentations = [
    {
      "title": "Iqtisodiyot nazaryasi Xoshirnov P.Z, Sodiqov N.K,   Saparov T.O, Boynazarov E.E",
      "path":
          "https://library.tsdi.uz/storage/books/March2022/vrqhxM2fACagvbnlppzn.pdf"
    },
    {
      "title": "Iqtisodiyot nazariyasi  Z.T. GAIBNAZAROVA, SH.A. ISAMUXAMETOV",
      "path":
          "https://namdu.uz/media/Books/pdf/2024/05/30/NamDU-ARM-2538-Iqtisodiyot_nazariyasi.pdf"
    },
    {
      "title": "IQTISODIYOTGA OID ATAMALAR VA TUSHUNCHALAR IZOHLI LUG/'ATI",
      "path": "https://api.ziyonet.uz/uploads/books/921690/5b0bd41780f94.pdf"
    },
    {
      "title": "Iqtisodiyot talimotlari tarixi   A. RAZZOQOV, SH. TASHMATOV, N. 0 ‘RM 0N0Y",
      "path": "https://library.tuit.uz/knigiPDF/eko/3-45.pdf"
    },
    {
      "title": "Iqtisodiyot talimotlari tarixi  Q. YO‘LDOSHEV, Q. MUFTAYDINOV, V. ABDURAHMONOV",
      "path":
          "https://namdu.uz/media/Books/pdf/2024/05/29/NamDU-ARM-2428-Iqtisodiy_talimotlar_tarixi.pdf"
    },
    {
      "title":
          "IQTISODIY TA’LIMOTLAR TARIXI Q. YO‘LDOSHEV, Q. MUFTAYDINOV, V. ABDURAHMONOV",
      "path":
          "https://namdu.uz/media/Books/pdf/2024/05/29/NamDU-ARM-2428-Iqtisodiy_talimotlar_tarixi.pdf"
    },
    {
      "title":
          "A. RAZZOQOV, SH. TASHMATOV, N. 0 ‘RM 0N0Y IQTISODIY TA’LIMOTLAR TARIXI",
      "path": "https://library.tuit.uz/knigiPDF/eko/3-45.pdf"
    },
    {
      "title": "IQTISODIYOTGA OID ATAMALAR VA TUSHUNCHALAR IZOHLI LUG'ATI",
      "path": "https://api.ziyonet.uz/uploads/books/921690/5b0bd41780f94.pdf"
    },
    {
      "title": "IQTISODIYOTGA OID ATAMALAR VA TUSHUNCHALAR IZOHLI LUG'ATI",
      "path": "https://api.ziyonet.uz/uploads/books/921690/5b0bd41780f94.pdf"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF087268),
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
                  builder: (context) => UrlReaderPage(
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
