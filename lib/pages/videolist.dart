import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nordic_unviersity/pages/playvideo.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({super.key});

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  final List<Map<String, String>> videos = [
    {
      "title": "Iqtisodiyotga kirish: Raqobat va monopoliya",
      "url":
          "DePqk44thWA"
    },
    {
      "title": "Iqtisodiyotga kirish: Iste’molchilar tanlovi nazariyasi",
      "url":
          "a0dub_fG1Eg"
    },
    {
      "title": "Iqtisodiyotga kirish: Talab, taklif, bozor muvozanati",
      "url":
          "ljJeusm-XSg"
    },
    {
      "title":
          "Iqtisodiyotga kirish: Bozor iqtisodiyotining mazmuni va unga o‘tish yo‘llari",
      "url":
          "kF9zzkwL6Qk"
    },
    {
      "title": "Iqtisodiyotga kirish: Tovar pul munosabatlari",
      "url":
          "jkPgr9uz_hY"
    },
    {
      "title": "Iqtisodiyotga kirish: Iqtisodiy tizimlar va mulkchilik",
      "url":
          "auzNxx8dWYc"
    },
    {
      "title":
          "Iqtisodiyotga kirish: Ishlab chiqarish jarayoni va uning natijalari",
      "url":
          "qf2RatuNBAE"
    },
    {
      "title": "Iqtisodiyotga kirish: Iqtisodiyot bilan tanishuv",
      "url":
          "uhTZk8dOBnM"
    },
    {
      "title": "Iqtisodiyotga kirish: Narxning mohiyati va shakllanishi",
      "url":
          "ewGOBmdAGsQ"
    },
    {
      "title": "Iqtisodiyotga kirish: Tadbirkorlik faoliyati",
      "url":
          "i1w90MukZ-g"
    },
    {
      "title": "Iqtisodiyotga kirish: Ishlab chiqarish xarajatlari va foydasi",
      "url":
          "S2qhBU7JNas"
    },
    {
      "title": "Iqtisodiyotga kirish: Ish haqi va mehnat munosabatlari",
      "url":
          "S2m2F_9QoZQ"
    },
    {
      "title": "Iqtisodiyotga kirish: Agrar munosabatlar va agrobiznes",
      "url":
          "g9bsSbbCZu4"
    },
    {
      "title": "Iqtisodiyotga kirish: Iqtisodiy o‘sish va milliy boylik",
      "url":
          "MRogIthNHZ"
    },
    {
      "title": "Iqtisodiyotga kirish: Yalpi talab va yalpi taklif",
      "url":
          "QJQ2qGiuHvY"
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
          "Video darslar",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return ListViewWidget(
            title: videos[index]['title']!,
            onClicked: () {
              final url = videos[index]['url']!;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayVideoPage(
                    urlVideo: url,
                  ),
                ),
              );
              // Navigate to the PlayVideoPage or open the URL
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
        margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
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
              child: const Center(child: Icon(Icons.play_arrow)),
            )
          ],
        ),
      ),
    );
  }
}
