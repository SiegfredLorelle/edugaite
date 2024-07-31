import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/nav-footer.dart';

class LearningProgressPage extends StatelessWidget {
  const LearningProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: LearningProgressPageHeader(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: LearningProgressPageBody(),
            ),
          ),
          const NavFooter(),
        ],
      ),
    );
  }
}

class LearningProgressPageHeader extends StatelessWidget {
  const LearningProgressPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0, // Set desired height
      color: Colors.white70,
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.arrowLeft, size: 20),
            color: const Color.fromRGBO(13, 18, 28, 0.867),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class LearningProgressPageBody extends StatelessWidget {
  const LearningProgressPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.white70,
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            child: const Text(
              "Learning Progress",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28.0,
                color: Color.fromRGBO(13, 18, 28, 0.867),
                fontFamily: "Lexend",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Image(
              image: AssetImage('assets/images/profile/profile.png'),
            ),
          ),
          Container(
            color: Colors.white70,
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "You're on fire!",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromRGBO(13, 18, 28, 0.867),
                    fontFamily: "Lexend",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Keep it up!",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromRGBO(79, 102, 150, 1),
                    fontFamily: "Lexend",
                  ),
                ),
                Text(
                  "Joined 2020, 2nd year",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromRGBO(79, 102, 150, 1),
                    fontFamily: "Lexend",
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white70,
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(232, 235, 242, 0.867),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      foregroundColor: const Color.fromRGBO(13, 18, 28, 0.867),
                      textStyle: const TextStyle(
                        fontSize: 12.0,
                        fontFamily: "Lexend",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Share Learning Progress'),
                  ),
                ),
                const SizedBox(width: 8.0), // Add some spacing between the buttons
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(26, 92, 229, 0.867),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      foregroundColor: const Color.fromRGBO(232, 235, 242, 0.867),
                      textStyle: const TextStyle(
                        fontSize: 12.0,
                        fontFamily: "Lexend",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Add Note'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: const Text(
              "Quick Access",
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromRGBO(13, 18, 28, 0.867),
                fontFamily: "Lexend",
                fontWeight: FontWeight.bold,
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
                    color: const Color.fromRGBO(232, 235, 242, 0.867),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: IconButton(
                    icon: const FaIcon(FontAwesomeIcons.bookOpen, size: 16),
                    color: const Color.fromRGBO(13, 18, 28, 0.867),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8.0), // Add some spacing between the buttons
                const Text(
                  "Math Curriculum",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromRGBO(13, 18, 28, 0.867),
                    fontFamily: "Lexend",
                  ),
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
                    color: const Color.fromRGBO(232, 235, 242, 0.867),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: IconButton(
                    icon: const FaIcon(FontAwesomeIcons.circlePlus, size: 16),
                    color: const Color.fromRGBO(13, 18, 28, 0.867),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8.0), // Add some spacing between the buttons
                const Text(
                  "New Course",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromRGBO(13, 18, 28, 0.867),
                    fontFamily: "Lexend",
                  ),
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
                    color: const Color.fromRGBO(232, 235, 242, 0.867),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: IconButton(
                    icon: const FaIcon(FontAwesomeIcons.userPlus, size: 16),
                    color: const Color.fromRGBO(13, 18, 28, 0.867),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8.0), // Add some spacing between the buttons
                const Text(
                  "Add Track",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromRGBO(13, 18, 28, 0.867),
                    fontFamily: "Lexend",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
