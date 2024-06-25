import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/profile.dart';
import '../screens/track.dart';
import '../screens/courses.dart';

class NavFooter extends StatelessWidget {
  const NavFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white70,
        border: Border(
          top: BorderSide(
            color: Color.fromRGBO(232, 235, 242, 0.867), // Border color
            width: 1.5, // Border width
          ),
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.house),
                color: const Color.fromRGBO(13, 18, 28, 0.867),
                onPressed: () {
                  if (ModalRoute.of(context)?.settings.name != '/profile') {
                    Navigator.pushNamed(context, '/profile');
                  }
                },
              ),
              const Text(
                'Home',
                style: TextStyle(
                  color: Color.fromRGBO(13, 18, 28, 0.867),
                  fontFamily: "Lexend",
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.users),
                color: const Color.fromRGBO(13, 18, 28, 0.867),
                onPressed: () {
                  if (ModalRoute.of(context)?.settings.name != '/track') {
                    Navigator.pushNamed(context, '/track');
                  }
                },
              ),
              const Text(
                'Track',
                style: TextStyle(
                  color: Color.fromRGBO(13, 18, 28, 0.867),
                  fontFamily: "Lexend",
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.bookOpen),
                color: const Color.fromRGBO(13, 18, 28, 0.867),
                onPressed: () {
                  if (ModalRoute.of(context)?.settings.name != '/courses') {
                    Navigator.pushNamed(context, '/courses');
                  }
                },
              ),
              const Text(
                'Courses',
                style: TextStyle(
                  color: Color.fromRGBO(13, 18, 28, 0.867),
                  fontFamily: "Lexend",
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
