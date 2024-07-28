import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/nav-footer.dart';

class ChatLessonPage extends StatelessWidget {
  const ChatLessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: ChatLessonPageHeader(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: ChatLessonPageBody(),
            ),
          ),
          const NavFooter(),
        ],
      ),
    );
  }
}

class ChatLessonPageHeader extends StatelessWidget {
  const ChatLessonPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0, // Set desired height
      color: Colors.white70,
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.angleDown, size: 20),
              color: const Color.fromRGBO(13, 18, 28, 0.867),
              onPressed: () {
                // Define your action here
              },
            ),
          ),
          Center(
            child: Text(
              'Challenge',
              style: TextStyle(
                fontSize: 24.0,
                color: const Color.fromRGBO(13, 18, 28, 0.867),
                fontFamily: "Lexend",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatLessonPageBody extends StatelessWidget {
  const ChatLessonPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: const Text(
                "CHAT PAGE",
                textAlign: TextAlign.center,
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
                "You'll find challenges that are designed to keep you engaged and motivated. Each challenge has a different theme and a set of questions.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromRGBO(13, 18, 28, 0.867),
                  fontFamily: "Lexend",
                ),
              ),
            ),
            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(232, 235, 242, 0.867), // Set your desir,
                      borderRadius: BorderRadius.circular(12.0), // Border radius
                    ),
                    child: IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.bookOpen,
                        size: 16,
                      ),
                      color: const Color.fromRGBO(13, 18, 28, 0.867),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 8.0), // Add some spacing between the buttons
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Time to Complete",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color.fromRGBO(13, 18, 28, 0.867), // Se
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "5 minutes",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(79, 102, 150, 1), // Label text color
                          fontFamily: "Lexend",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(232, 235, 242, 0.867), // Set your desir,
                      borderRadius: BorderRadius.circular(12.0), // Border radius
                    ),
                    child: IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.circlePlus,
                        size: 16,
                      ),
                      color: const Color.fromRGBO(13, 18, 28, 0.867),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 8.0), // Add some spacing between the buttons
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Question Type",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color.fromRGBO(13, 18, 28, 0.867), // Se
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "multiple choice, true or false",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(79, 102, 150, 1), // Label text color
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
                  Navigator.pushNamed(context, '/courses/pretest');
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(26, 92, 229,
                        0.867), // Set your desired background color, // Set button color
                  padding: const EdgeInsets.symmetric(vertical: 4.0), // Set padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0), // Rounded edges
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white, // Set text color
                    fontSize: 16.0, // Set text size
                    fontFamily: "Lexend",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
