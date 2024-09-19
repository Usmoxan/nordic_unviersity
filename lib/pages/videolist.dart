import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nordic_unviersity/pages/playvideo.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({super.key});

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF296BCF),
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Video darslar",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListViewWidget(
              title: "Iqtisodiyotga kirish: Raqobat va monopoliya",
              onClicked: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlayVideoPage()));
              },
            ),
            ListViewWidget(
              title: "Iqtisodiyotga kirish: Raqobat va monopoliya",
              onClicked: () {},
            ),
            ListViewWidget(
              title: "Iqtisodiyotga kirish: Raqobat va monopoliya",
              onClicked: () {},
            ),
            ListViewWidget(
              title: "Iqtisodiyotga kirish: Raqobat va monopoliya",
              onClicked: () {},
            ),
            ListViewWidget(
              title: "Iqtisodiyotga kirish: Raqobat va monopoliya",
              onClicked: () {},
            ),
            ListViewWidget(
              title: "Iqtisodiyotga kirish: Raqobat va monopoliya",
              onClicked: () {},
            ),
          ],
        ),
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
        margin: const EdgeInsets.only(top: 15),
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
                  style:
                      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: const Color(0xFFCBCBCB),
                  borderRadius: BorderRadius.circular(60)),
              child: const Center(child: Icon(Icons.play_arrow)),
            )
          ],
        ),
      ),
    );
  }
}
