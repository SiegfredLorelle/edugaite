import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/home-image-carousel.dart';
import '../screens/login.dart';
import '../screens/game_screen.dart'; // Import the game screen

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: HomePageHeader(),
      ),
      body: HomePageBody(),
    );
  }
}

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  void _openSearch() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0, // Set desired height
      color: Colors.white70,
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(children: <Widget>[
            Text(
              'Edu',
              style: TextStyle(
                fontSize: 24.0,
                color: Color.fromRGBO(221, 150, 12, 0.867),
                fontFamily: "Lexend",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'GAIte',
              style: TextStyle(
                fontSize: 24.0,
                color: Color.fromRGBO(35, 89, 197, 0.867),
                fontFamily: "Lexend",
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass, size: 20),
            color: const Color.fromRGBO(13, 18, 28, 0.867),
            onPressed: _openSearch,
          ),
        ],
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    int currentYear = DateTime.now().year;

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            const Image(image: AssetImage('assets/images/home-hero.png')),
            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: const Text(
                "Empowering Teachers, Enhancing Education",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                  color: Color.fromRGBO(13, 18, 28, 0.867),
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: const Text(
                "Gamified, AI-powered training for Math and Science teachers",
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
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: Row(children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text('Get Started'),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(26, 92, 229,
                        0.867), // Set your desired background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Customize button shape
                    ),
                    foregroundColor: const Color.fromRGBO(
                        232, 235, 242, 0.867), // Set your desired color here
                    textStyle: const TextStyle(
                      fontSize: 12.0, // Set text size
                      fontFamily: "Lexend",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text('Sign In'),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(232, 235, 242,
                        0.867), // Set your desired background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Customize button shape
                    ),
                    foregroundColor: const Color.fromRGBO(
                        13, 18, 28, 0.867), // Set your desired color here
                    textStyle: const TextStyle(
                      fontSize: 12.0, // Set text size
                      fontFamily: "Lexend",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameScreen()),
                  );
                },
                child: const Text('Go to Game'),
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(
                      26, 92, 229, 0.867), // Set your desired background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12.0), // Customize button shape
                  ),
                  foregroundColor: const Color.fromRGBO(
                      232, 235, 242, 0.867), // Set your desired color here
                  textStyle: const TextStyle(
                    fontSize: 12.0, // Set text size
                    fontFamily: "Lexend",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: const Text(
                "Why EduGAIte for schools?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromRGBO(13, 18, 28, 0.867),
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const ImageCarousel(),
            Container(
              width: double.infinity,
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.xTwitter),
                    color: const Color.fromRGBO(13, 18, 28, 0.867),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.linkedinIn),
                    color: const Color.fromRGBO(13, 18, 28, 0.867),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.copyright,
                    size: 12.0,
                    color: const Color.fromRGBO(13, 18, 28, 0.867),
                  ),
                  Text(
                    ' $currentYear EduGAIte, Inc. All rights reserved.',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: const Color.fromRGBO(13, 18, 28, 0.867),
                      fontFamily: "Lexend",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
