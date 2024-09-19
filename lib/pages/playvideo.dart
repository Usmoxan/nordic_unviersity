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
      initialVideoId: 'iLnmTe5Q2Qw',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
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
      appBar: AppBar(
        backgroundColor: const Color(0xFF296BCF),
        title: const Text(
          "Custom Video Player",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
            progressColors: const ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
            onReady: () {
              _controller.addListener(() {});
            },
          ),
          ElevatedButton(
            onPressed: () {
              _controller.play();
            },
            child: const Text("Play"),
          ),
          ElevatedButton(
            onPressed: () {
              _controller.pause();
            },
            child: const Text("Pause"),
          ),
        ],
      ),
    );
  }
}
