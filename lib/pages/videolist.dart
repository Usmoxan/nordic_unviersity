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
          "https://www.youtube.com/watch?v=DePqk44thWA&list=PLBu7dpSSVMc7iSKaX5H4mIxMMU4crSEjm"
    },
    {
      "title": "Iqtisodiyotga kirish: Iste’molchilar tanlovi nazariyasi",
      "url":
          "https://www.youtube.com/watch?v=a0dub_fG1Eg&list=PLBu7dpSSVMc7iSKaX5H4mIxMMU4crSEjm&index=2"
    },
    {
      "title": "Iqtisodiyotga kirish: Talab, taklif, bozor muvozanati",
      "url":
          "https://www.youtube.com/watch?v=ljJeusm-XSg&list=PLBu7dpSSVMc7iSKaX5H4mIxMMU4crSEjm&index=3"
    },
    {
      "title":
          "Iqtisodiyotga kirish: Bozor iqtisodiyotining mazmuni va unga o‘tish yo‘llari",
      "url":
          "https://www.youtube.com/watch?v=kF9zzkwL6Qk&list=PLBu7dpSSVMc7iSKaX5H4mIxMMU4crSEjm&index=4"
    },
    {
      "title": "Iqtisodiyotga kirish: Tovar pul munosabatlari",
      "url":
          "https://www.youtube.com/watch?v=jkPgr9uz_hY&list=PLBu7dpSSVMc7iSKaX5H4mIxMMU4crSEjm&index=5"
    },
    {
      "title": "Iqtisodiyotga kirish: Iqtisodiy tizimlar va mulkchilik",
      "url":
          "https://www.youtube.com/watch?v=auzNxx8dWYc&list=PLBu7dpSSVMc7iSKaX5H4mIxMMU4crSEjm&index=6"
    },
    {
      "title":
          "Iqtisodiyotga kirish: Ishlab chiqarish jarayoni va uning natijalari",
      "url":
          "https://www.youtube.com/watch?v=qf2RatuNBAE&list=PLBu7dpSSVMc7iSKaX5H4mIxMMU4crSEjm&index=7"
    },
    {
      "title": "Iqtisodiyotga kirish: Iqtisodiyot bilan tanishuv",
      "url":
          "https://www.youtube.com/watch?v=uhTZk8dOBnM&list=PLBu7dpSSVMc7iSKaX5H4mIxMMU4crSEjm&index=8"
    },
    {
      "title": "Iqtisodiyotga kirish: Narxning mohiyati va shakllanishi",
      "url":
          "https://www.youtube.com/watch?v=ewGOBmdAGsQ&list=PLBu7dpSSVMc7iSKaX5H4mIxMMU4crSEjm&index=9"
    },
    {
      "title": "Iqtisodiyotga kirish: Tadbirkorlik faoliyati",
      "url":
          "https://www.youtube.com/watch?v=i1w90MukZ-g&list=PLBu7dpSSVMc7iSKaX5H4mIxMMU4crSEjm&index=10"
    },
    {
      "title": "Iqtisodiyotga kirish: Ishlab chiqarish xarajatlari va foydasi",
      "url":
          "https://www.youtube.com/watch?v=S2qhBU7JNas&list=PLBu7dpSSVMc7iSKaX5H4mIxMMU4crSEjm&index=11"
    },
    {
      "title": "Iqtisodiyotga kirish: Ish haqi va mehnat munosabatlari",
      "url":
          "https://www.youtube.com/watch?v=S2m2F_9QoZQ&list=PLBu7dpSSVMc7iSKaX5H4mIxMMU4crSEjm&index=12"
    },
    {
      "title": "Iqtisodiyotga kirish: Agrar munosabatlar va agrobiznes",
      "url":
          "https://www.youtube.com/watch?v=g9bsSbbCZu4&list=PLBu7dpSSVMc7iSKaX5H4mIxMMU4crSEjm&index=13"
    },
    {
      "title": "Iqtisodiyotga kirish: Iqtisodiy o‘sish va milliy boylik",
      "url":
          "https://www.youtube.com/watch?v=MRogIthNHZ8&list=PLBu7dpSSVMc7iSKaX5H4mIxMMU4crSEjm&index=14"
    },
    {
      "title": "Iqtisodiyotga kirish: Yalpi talab va yalpi taklif",
      "url":
          "https://www.youtube.com/watch?v=QJQ2qGiuHvY&list=PLBu7dpSSVMc7iSKaX5H4mIxMMU4crSEjm&index=15"
    },
  ];

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
