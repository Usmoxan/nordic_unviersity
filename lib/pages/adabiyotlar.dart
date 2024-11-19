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
    {"title": "Iqtisodiy ta'limotlar tarixi SH.H.Tashmatov, X,S.Asatullaev", "path": "https://ebook.tsue.uz/public/ebooks/iqtisodiy-ta-limotlar-tarixi"},
    {"title": ",IQTISODIY ATAMALARNING IZOHLI LUG'ATI SH.I. MUSTAFAKULOV, O.A. RAXIMBERDIYEV, M.SH. EGAMBERDIYEVA", "path": "https://ebook.tsue.uz/public/ebooks/iqtisodiy-atamalarning-izohli-lug-ati"},
    {"title": "ZAMONAVIY IQTISODIY NAZARIYALAR U.V. G‘AFUROV, B.E. MAMARAHIMOV, Q.B. SHARIPOV, F.O. OTABOYEV", "path": "https://ebook.tsue.uz/public/ebooks/zamonaviy-iqtisodiy-nazariyalar"},
    {"title": "IQTISODIYOT NAZARIYASIDA MUNOZARALAR U.V. G'AFUROV, Z.A. XAMIDOVA", "path": "https://ebook.tsue.uz/public/ebooks/iqtisodiyot-nazariyasida-munozaralar"},
 
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
