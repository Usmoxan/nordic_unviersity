import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nordic_unviersity/pages/pdfreader.dart';

class TaqdimotlarPage extends StatefulWidget {
  const TaqdimotlarPage({super.key});

  @override
  State<TaqdimotlarPage> createState() => _TaqdimotlarPageState();
}

class _TaqdimotlarPageState extends State<TaqdimotlarPage> {
  final List<Map<String, String>> presentations = [
    {"title": "1-mavzu taqdimoti", "path": "assets/files/taqdimotlar/mavzu1.pdf"},
    {"title": "2-mavzu taqdimoti", "path": "assets/files/taqdimotlar/mavzu2.pdf"},
    {"title": "3-mavzu taqdimoti", "path": "assets/files/taqdimotlar/mavzu3.pdf"},
    {"title": "4-mavzu taqdimoti", "path": "assets/files/taqdimotlar/mavzu4.pdf"},
    {"title": "5-mavzu taqdimoti", "path": "assets/files/taqdimotlar/mavzu5.pdf"},
    {"title": "6-mavzu taqdimoti", "path": "assets/files/taqdimotlar/mavzu6.pdf"},
    {"title": "7-mavzu taqdimoti", "path": "assets/files/taqdimotlar/mavzu7.pdf"},
    {"title": "8-mavzu taqdimoti", "path": "assets/files/taqdimotlar/mavzu8.pdf"},
    {"title": "9-mavzu taqdimoti", "path": "assets/files/taqdimotlar/mavzu9.pdf"},
    {"title": "10-mavzu taqdimoti", "path": "assets/files/taqdimotlar/mavzu10.pdf"},
    {"title": "11-mavzu taqdimoti", "path": "assets/files/taqdimotlar/mavzu11.pdf"},
    {"title": "12-mavzu taqdimoti", "path": "assets/files/taqdimotlar/mavzu12.pdf"},
    {"title": "13-mavzu taqdimoti", "path": "assets/files/taqdimotlar/mavzu13.pdf"},
    {"title": "14-mavzu taqdimoti", "path": "assets/files/taqdimotlar/mavzu14.pdf"},
    {"title": "15-mavzu taqdimoti", "path": "assets/files/taqdimotlar/mavzu15.pdf"},
    {"title": "16-mavzu taqdimoti", "path": "assets/files/taqdimotlar/mavzu16.pdf"},
    {"title": "17-mavzu taqdimoti", "path": "assets/files/taqdimotlar/mavzu17.pdf"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF296BCF),
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "PPT taqdimotlar",
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
