import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/nav-footer.dart';


class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: CoursesPageHeader(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: CoursesPageBody(),
            ),
          ),
          const NavFooter(),
        ],
      ),    
    );
  }
}

class CoursesPageHeader extends StatelessWidget {
  const CoursesPageHeader({super.key});

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



class CoursesPageBody extends StatelessWidget {
  const CoursesPageBody({super.key});

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
                "Welcome to the fun part of your learning journey!",
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
          ],
        ),
      ),
    );
  }
}
