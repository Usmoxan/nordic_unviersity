import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideoPage extends StatefulWidget {
  final String urlVideo;
  const PlayVideoPage({super.key, required this.urlVideo});

  @override
  State<PlayVideoPage> createState() => _PlayVideoPageState();
}

class _PlayVideoPageState extends State<PlayVideoPage> {
  late YoutubePlayerController _controller;

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
          .toggleFullScreenMode(); // Exit fullscreen if in fullscreen mode
      return Future.value(
          false); // Prevent back navigation while exiting fullscreen
    }
    return Future.value(
        true); // Allow back navigation when not in fullscreen mode
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop, // Intercept the back button
      child: Scaffold(
        backgroundColor: Colors.black,
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
              _controller.addListener(() {}); // Add any listener if needed
            },
          ),
          builder: (context, player) {
            return Stack(
              children: [
                Positioned.fill(child: player), // Player takes full screen
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () async {
                      if (_controller.value.isFullScreen) {
                        _controller
                            .toggleFullScreenMode(); // Exit fullscreen first
                      } else {
                        Navigator.pop(context); // Navigate back
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
