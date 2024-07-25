import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/nav-footer.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: LessonPageHeader(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: LessonPageBody(),
            ),
          ),
          const NavFooter(),
        ],
      ),
    );
  }
}

class LessonPageHeader extends StatelessWidget {
  const LessonPageHeader({super.key});

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
                // Define your action here
              },
            ),
          ),
          Center(
            child: Text(
              'AI Visualization',
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

class LessonPageBody extends StatelessWidget {
  const LessonPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align all text to the left
          children: <Widget>[
            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: const Text(
                "Let's explore how to visualize a fraction.",
                textAlign: TextAlign.left, // Align text to the left
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
                textAlign: TextAlign.left, // Align text to the left
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromRGBO(13, 18, 28, 0.867),
                  fontFamily: "Lexend",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
