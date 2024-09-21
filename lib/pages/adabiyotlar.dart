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
    {"title": "IQTISODIYOT NAZARIYASI", "path": "assets/adabiyot/adabiyotlar1.pdf"},
    {"title": "IQTISODIYOT NAZARIYASI, QO`LLANMA", "path": "assets/adabiyot/adabiyotlar2.pdf"},
    {"title": "Iqtisodiyot nazariyasi (Yu.Yo'ldoshev)", "path": "assets/adabiyot/adabiyotlar3.pdf"},
    {"title": "Iqtisodiy talimotlar tarixi", "path": "assets/adabiyot/adabiyotlar4.pdf"},
    {"title": "Iqtisod nazariyasi Qobilov darslik 2013", "path": "assets/adabiyot/adabiyotlar5.pdf"},
    {"title": "Tashmatov Sh H va b Iqtisodiy ta'limotlar tarixi Darslik 2019", "path": "assets/adabiyot/adabiyotlar6.pdf"},
    {"title": "Замонавий иктисодий назариялар 2", "path": "assets/adabiyot/adabiyotlar7.pdf"},
    {"title": "АРМ_Tashmatov_Sh_H_Iqtisodiy_ta'limotlar_tarixi_Darslik_2019_", "path": "assets/adabiyot/adabiyotlar8.pdf"},
    {"title": "Iqtisodiy atamalarning o'zbekcha-inglizcha-ruscha lug'ati (Toshturg'un Ergashev)", "path": "assets/adabiyot/adabiyotlar9.pdf"},
    {"title": "Iqtisodiyot nazariyasi. 2-kitob (D.Tojiboyev)", "path": "assets/adabiyot/adabiyotlar10.pdf"},
    {"title": "Iqtisodiyot nazariyasi (A.O'lmasov, M.Sharifxo'jayev)", "path": "assets/adabiyot/adabiyotlar11.pdf"},
    {"title": "IQTISODIYOT NAZARIYASIDA MUNOZARALAR", "path": "assets/adabiyot/adabiyotlar12.pdf"},
    {"title": "Iqtisodiyot nazariyasi Olmasov A. Vahobov A. 2014 (2)", "path": "assets/adabiyot/adabiyotlar13.pdf"}
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
