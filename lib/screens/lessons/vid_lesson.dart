import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

import '../../widgets/nav-footer.dart';

class VidLessonPage extends StatelessWidget {
  const VidLessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const VidLessonPageBody(),
    );
  }
}

class VidLessonPageHeader extends StatelessWidget {
  const VidLessonPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0, // Set desired height
      color: Colors.white70,
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.arrowLeft, size: 20),
              color: const Color.fromRGBO(13, 18, 28, 0.867),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Center(
            child: Text(
              'VARK Learning Style',
              style: TextStyle(
                fontSize: 24.0,
                color: const Color.fromRGBO(13, 18, 28, 0.867),
                fontFamily: "Lexend",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Center the header text
            ),
          ),
        ],
      ),
    );
  }
}

class VidLessonPageBody extends StatefulWidget {
  const VidLessonPageBody({super.key});

  @override
  _VidLessonPageBodyState createState() => _VidLessonPageBodyState();
}

class _VidLessonPageBodyState extends State<VidLessonPageBody> {
  bool _isFullscreen = false;

  void _toggleFullscreen() {
    setState(() {
      _isFullscreen = !_isFullscreen;
      if (_isFullscreen) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!_isFullscreen) const VidLessonPageHeader(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (!_isFullscreen) ...[
                  Container(
                    color: Colors.white70,
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                    child: const Text(
                      "Let's explore how to visualize a fraction.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Color.fromRGBO(13, 18, 28, 0.867),
                        fontFamily: "Lexend",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white70,
                    padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                    child: const Text(
                      "We can use different shapes and colors to represent the fraction.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromRGBO(13, 18, 28, 0.867),
                        fontFamily: "Lexend",
                      ),
                    ),
                  ),
                ],
                Container(
                  color: Colors.white70,
                  padding: const EdgeInsets.all(8.0),
                  child: VideoGallery(toggleFullscreen: _toggleFullscreen),
                ),
                if (!_isFullscreen) ...[
                  Container(
                    color: Colors.white70,
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(232, 235, 242, 0.867),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: IconButton(
                            icon: const FaIcon(FontAwesomeIcons.circleCheck, size: 16),
                            color: const Color.fromRGBO(13, 18, 28, 0.867),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Fraction",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: "Lexend",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "1/2 - 1 out of 2 slices are shaded.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Color.fromRGBO(79, 102, 150, 1),
                                fontFamily: "Lexend",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/courses/chat_lesson');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(26, 92, 229, 0.867),
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36.0),
                        ),
                      ),
                      child: const Text(
                        'Go Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        if (!_isFullscreen) const NavFooter(),
      ],
    );
  }
}

class VideoGallery extends StatelessWidget {
  final VoidCallback toggleFullscreen;

  const VideoGallery({required this.toggleFullscreen, super.key});

  @override
  Widget build(BuildContext context) {
    // Replace these paths with your video asset paths or URLs
    final List<String> videoPaths = [
      'assets/videos/algebra-sample-video.mp4',
    ];

    return GridView.builder(
      shrinkWrap: true, // Important to use in nested scrollable widgets
      physics: const NeverScrollableScrollPhysics(), // Prevent grid view from scrolling
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 12.0, // Smaller gap between videos
        mainAxisSpacing: 12.0, // Smaller gap between videos
      ),
      itemCount: videoPaths.length,
      itemBuilder: (context, index) {
        return VideoPlayerWidget(videoPath: videoPaths[index], toggleFullscreen: toggleFullscreen);
      },
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;
  final VoidCallback toggleFullscreen;

  const VideoPlayerWidget({required this.videoPath, required this.toggleFullscreen, super.key});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  double _volume = 0.5;
  bool _showPlayButton = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath);
    _initializeVideoPlayerFuture = _controller.initialize().catchError((error) {
      print('Error initializing video: $error');
    });
    _controller.setVolume(_volume);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleMute() {
    setState(() {
      _volume = _volume > 0 ? 0 : 0.5; // Toggle between mute and half volume
      _controller.setVolume(_volume);
    });
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _showPlayButton = true;
      } else {
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0), // Round the corners
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(_controller),
                  if (_showPlayButton)
                    Positioned(
                      bottom: 10.0,
                      left: 10.0,
                      child: IconButton(
                        icon: Icon(
                          _controller.value.isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                          size: 24.0,
                          color: Colors.black, // Change the color of the control
                        ),
                        onPressed: _togglePlayPause,
                      ),
                    ),
                  Positioned(
                    bottom: 10.0,
                    left: 50.0,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            _volume > 0 ? Icons.volume_up : Icons.volume_off,
                            color: Colors.black,
                          ),
                          onPressed: _toggleMute,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 160, // Adjust width dynamically
                          child: Slider(
                            value: _volume,
                            min: 0,
                            max: 1,
                            divisions: 10,
                            onChanged: (value) {
                              setState(() {
                                _volume = value;
                                _controller.setVolume(_volume);
                              });
                            },
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.fullscreen,
                            size: 24.0,
                            color: Colors.black, // Change the color of the control
                          ),
                          onPressed: widget.toggleFullscreen,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
