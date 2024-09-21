import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart'; // To control the device orientation

class PlayVideoPage extends StatefulWidget {
  final String urlVideo;
  const PlayVideoPage({super.key, required this.urlVideo});

  @override
  State<PlayVideoPage> createState() => _PlayVideoPageState();
}

class _PlayVideoPageState extends State<PlayVideoPage> {
  late YoutubePlayerController _controller;
  bool isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.urlVideo, // Replace with your video ID
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        isLive: false,
        forceHD: true,
        enableCaption: true,
      ),
    );

    _controller.addListener(() {
      if (_controller.value.isFullScreen && !isFullScreen) {
        setState(() {
          isFullScreen = true;
        });
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      } else if (!(_controller.value.isFullScreen) && isFullScreen) {
        setState(() {
          isFullScreen = false;
        });
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    if (isFullScreen) {
      _controller.toggleFullScreenMode();
      return false; // Prevent the back button from closing the page
    }
    return true; // Allow back button to close the page if not in full-screen
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop, // Override the back button press
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: YoutubePlayer(
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
        ),
      ),
    );
  }
}
