// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class PlayVideoPage extends StatefulWidget {
//   const PlayVideoPage({super.key});

//   @override
//   State<PlayVideoPage> createState() => _PlayVideoPageState();
// }

// class _PlayVideoPageState extends State<PlayVideoPage> {
//   late YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: 'iLnmTe5Q2Qw',
//       flags: const YoutubePlayerFlags(
//         autoPlay: false,
//         mute: false,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF296BCF),
//         title: const Text(
//           "Custom Video Player",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: YoutubePlayer(
//               controller: _controller,
//               showVideoProgressIndicator: true,
//               progressIndicatorColor: const Color(0xFF296BCF),
//               progressColors: const ProgressBarColors(
//                 playedColor: Color(0xFF296BCF),
//                 handleColor: Color(0xFF296BCF),
//               ),
//               onReady: () {
//                 _controller.addListener(() {});
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               _controller.play();
//             },
//             child: const Text("Play"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               _controller.pause();
//             },
//             child: const Text("Pause"),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideoPage extends StatefulWidget {
  const PlayVideoPage({super.key});

  @override
  State<PlayVideoPage> createState() => _PlayVideoPageState();
}

class _PlayVideoPageState extends State<PlayVideoPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'DePqk44thWA', // Replace with your video ID
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        isLive: false,
        forceHD: true,
        enableCaption: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Makes the background black for a cleaner look
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: const Color(0xFF296BCF),
          progressColors: const ProgressBarColors(
            playedColor: Color(0xFF296BCF),
            handleColor: Color(0xFF296BCF),
          ),
          onReady: () {
            _controller.addListener(() {});
          },
        ),
        builder: (context, player) {
          return Stack(
            children: [
              Positioned.fill(child: player), // Player takes full screen
              Positioned(
                top: 40, // Adjust the back button position
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context); // Back button functionality
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
