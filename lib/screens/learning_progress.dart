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

class LearningProgressPageBody extends StatefulWidget {
  const LearningProgressPageBody({super.key});

  @override
  _LearningProgressPageBodyState createState() =>
      _LearningProgressPageBodyState();
}

class _LearningProgressPageBodyState extends State<LearningProgressPageBody> {
  bool _showMoreOptions = false;

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
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: const Text(
              "Badges",
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
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: const Text(
              "Points",
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

          // Levels Section
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: const Text(
              "Levels",
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
                    icon: const FaIcon(FontAwesomeIcons.levelUpAlt, size: 16),
                    color: const Color.fromRGBO(13, 18, 28, 0.867),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8.0), // Add some spacing between the buttons
                const Text(
                  "Level 1",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromRGBO(13, 18, 28, 0.867),
                    fontFamily: "Lexend",
                  ),
                ),
              ],
            ),
          ),

          // Additional Buttons Section
          Center(
            child: Container(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _showMoreOptions = !_showMoreOptions;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "More Options ",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromRGBO(13, 18, 28, 0.867),
                        fontFamily: "Lexend",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      _showMoreOptions
                          ? FontAwesomeIcons.angleUp
                          : FontAwesomeIcons.angleDown,
                      color: const Color.fromRGBO(13, 18, 28, 0.867),
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: _showMoreOptions,
            child: Center(
              child: Container(
                color: Colors.white70,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      child: ElevatedButton.icon(
                        icon: const FaIcon(FontAwesomeIcons.trophy, size: 16),
                        label: const Text("Challenges"),
                        onPressed: () {
                          // Navigate to Challenges page
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(79, 102, 150, 1),
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50), // Set the size
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      child: ElevatedButton.icon(
                        icon: const FaIcon(FontAwesomeIcons.mapSigns, size: 16),
                        label: const Text("Learning Path"),
                        onPressed: () {
                          // Navigate to Learning Path page
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(79, 102, 150, 1),
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50), // Set the size
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      child: ElevatedButton.icon(
                        icon: const FaIcon(FontAwesomeIcons.comments, size: 16),
                        label: const Text("Feedback"),
                        onPressed: () {
                          // Navigate to Feedback page
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(79, 102, 150, 1),
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50), // Set the size
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      child: ElevatedButton.icon(
                        icon: const FaIcon(FontAwesomeIcons.users, size: 16),
                        label: const Text("Teach Community"),
                        onPressed: () {
                          // Navigate to Teach Community page
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(79, 102, 150, 1),
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50), // Set the size
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
