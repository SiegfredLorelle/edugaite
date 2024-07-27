import 'package:flutter/material.dart';

import '../widgets/nav-footer.dart';

class TrackPage extends StatelessWidget {
  const TrackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: TrackPageBody(),
          ),
          const NavFooter(),
        ],
      ),
    );
  }
}

class TrackPageHeader extends StatelessWidget {
  const TrackPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0, // Set desired height
      color: Colors.white70,
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [],
      ),
    );
  }
}

class TrackPageBody extends StatelessWidget {
  const TrackPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Bottom image
          Image.asset(
            'assets/images/track/background-2.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          // Centered image spanning the entire width
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            child: Image.asset(
              'assets/images/track/title.png', // replace with your image path
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          // Button over the image
          Positioned(
            bottom: 50.0, // Position the button at the bottom with some offset
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/game');
              },
              child: const Text(
                'Tap to Start',
                style: TextStyle(
                  color: Color.fromRGBO(13, 18, 28, 0.867),
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                textStyle: const TextStyle(
                  fontSize: 20.0,
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
