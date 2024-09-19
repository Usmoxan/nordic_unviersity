import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nordic_unviersity/pages/videolist.dart';

class MavzularPage extends StatefulWidget {
  const MavzularPage({super.key});

  @override
  State<MavzularPage> createState() => _MavzularPageState();
}

class _MavzularPageState extends State<MavzularPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF296BCF),
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Mavzular",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListViewWidget(
              title: "PPT taqdimotlar",
              onClicked: () {},
            ),
            ListViewWidget(
                title: "Video darslar",
                onClicked: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VideosPage()));
                }),
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
