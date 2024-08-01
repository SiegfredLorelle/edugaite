import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/nav-footer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: ProfilePageHeader(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: ProfilePageBody(),
            ),
          ),
          const NavFooter(),
        ],
      ),
    );
  }
}

class ProfilePageHeader extends StatelessWidget {
  const ProfilePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0, // Set desired height
      color: Colors.white70,
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
      margin: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.bell, size: 20),
            color: const Color.fromRGBO(13, 18, 28, 0.867),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class ProfilePageBody extends StatefulWidget {
  const ProfilePageBody({super.key});

  @override
  _ProfilePageBodyState createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePageBody> {
  bool _showSubjects = false;
  bool _showTracks = false;
  final String mathCurriculumUrl =
      'https://www.deped.gov.ph/wp-content/uploads/2019/01/Math-CG_with-tagged-math-equipment.pdf';

  void _toggleNewCourse() {
    setState(() {
      _showSubjects = !_showSubjects;
    });
  }

  void _toggleAddTrack() {
    setState(() {
      _showTracks = !_showTracks;
    });
  }

  void _launchURL() async {
    final Uri _url = Uri.parse(mathCurriculumUrl);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white70,
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            child: const Text(
              "Welcome to the new school year!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.0,
                color: Color.fromRGBO(13, 18, 28, 0.867),
                fontFamily: "Lexend",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Image(image: AssetImage('assets/images/profile/profile.png')),
          Container(
            color: Colors.white70,
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            child: const Column(children: <Widget>[
              Text(
                "Mrs. Johnson",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromRGBO(13, 18, 28, 0.867),
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Math Teacher",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromRGBO(79, 102, 150, 1), // Label text color
                  fontFamily: "Lexend",
                ),
              ),
              Text(
                "Joined 2020, 2nd year",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromRGBO(79, 102, 150, 1), // Label text color
                  fontFamily: "Lexend",
                ),
              ),
            ]),
          ),
          Container(
            color: Colors.white70,
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/learning_progress");
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(232, 235, 242,
                          0.867), // Set your desired background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12.0), // Customize button shape
                      ),
                      foregroundColor: const Color.fromRGBO(
                          13, 18, 28, 0.867), // Set your desired color here
                      textStyle: const TextStyle(
                        fontSize: 12.0, // Set text size
                        fontFamily: "Lexend",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Learning progress'),
                  ),
                ),
                const SizedBox(
                    width: 8.0), // Add some spacing between the buttons
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(26, 92, 229,
                          0.867), // Set your desired background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12.0), // Customize button shape
                      ),
                      foregroundColor: const Color.fromRGBO(
                          232, 235, 242, 0.867), // Set your desired color here
                      textStyle: const TextStyle(
                        fontSize: 12.0, // Set text size
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
                    color: const Color.fromRGBO(232, 235, 242,
                        0.867), // Set your desired background color
                    borderRadius: BorderRadius.circular(12.0), // Border radius
                  ),
                  child: IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.bookOpen,
                      size: 16,
                    ),
                    color: const Color.fromRGBO(13, 18, 28, 0.867),
                    onPressed: _launchURL,
                  ),
                ),
                const SizedBox(
                    width: 8.0), // Add some spacing between the buttons
                const Text(
                  "Math Curriculum",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromRGBO(
                        13, 18, 28, 0.867), // Set your desired color here
                    fontFamily: "Lexend",
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white70,
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(232, 235, 242,
                            0.867), // Set your desired background color
                        borderRadius:
                            BorderRadius.circular(12.0), // Border radius
                      ),
                      child: IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.circlePlus,
                          size: 16,
                        ),
                        color: const Color.fromRGBO(13, 18, 28, 0.867),
                        onPressed: _toggleNewCourse,
                      ),
                    ),
                    const SizedBox(
                        width: 8.0), // Add some spacing between the buttons
                    const Text(
                      "New Course",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromRGBO(
                            13, 18, 28, 0.867), // Set your desired color here
                        fontFamily: "Lexend",
                      ),
                    ),
                  ],
                ),
                if (_showSubjects) ...[
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(
                          26, 92, 229, 0.867), // Button color
                      foregroundColor: Colors.white, // Text color
                    ),
                    child: const Text('Math'),
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(
                          26, 92, 229, 0.867), // Button color
                      foregroundColor: Colors.white, // Text color
                    ),
                    child: const Text('Science'),
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(
                          26, 92, 229, 0.867), // Button color
                      foregroundColor: Colors.white, // Text color
                    ),
                    child: const Text('Filipino'),
                  ),
                ]
              ],
            ),
          ),
          Container(
            color: Colors.white70,
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(232, 235, 242,
                            0.867), // Set your desired background color
                        borderRadius:
                            BorderRadius.circular(12.0), // Border radius
                      ),
                      child: IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.userPlus,
                          size: 16,
                        ),
                        color: const Color.fromRGBO(13, 18, 28, 0.867),
                        onPressed: _toggleAddTrack,
                      ),
                    ),
                    const SizedBox(
                        width: 8.0), // Add some spacing between the buttons
                    const Text(
                      "Add Track",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromRGBO(
                            13, 18, 28, 0.867), // Set your desired color here
                        fontFamily: "Lexend",
                      ),
                    ),
                  ],
                ),
                if (_showTracks) ...[
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(
                          26, 92, 229, 0.867), // Button color
                      foregroundColor: Colors.white, // Text color
                    ),
                    child: const Text('Advance Algebra'),
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(
                          26, 92, 229, 0.867), // Button color
                      foregroundColor: Colors.white, // Text color
                    ),
                    child: const Text('Data Science'),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
