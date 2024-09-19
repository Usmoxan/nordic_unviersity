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

  Future<bool> _onWillPop() async {
    // Handle back button press logic here
    if (_controller.value.isFullScreen) {
      _controller
          .toggleFullScreenMode(); // Exit fullscreen if the video is in fullscreen mode
      return Future.value(false); // Prevent back navigation when in full screen
    }
    return Future.value(true); // Allow back navigation otherwise
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop, // Intercepts phone back button
      child: Scaffold(
        backgroundColor:
            Colors.black, // Makes the background black for a cleaner look
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
                      if (_controller.value.isFullScreen) {
                        _controller
                            .toggleFullScreenMode(); // Exit fullscreen first
                      } else {
                        Navigator.pop(context); // Go back if not in full screen
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
