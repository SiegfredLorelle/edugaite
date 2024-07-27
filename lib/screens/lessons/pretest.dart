import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/nav-footer.dart';

class PretestPage extends StatelessWidget {
  const PretestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: PretestPageHeader(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: PretestPageBody(),
            ),
          ),
          const NavFooter(),
        ],
      ),
    );
  }
}

class PretestPageHeader extends StatelessWidget {
  const PretestPageHeader({super.key});

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
              'Pretest',
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

class PretestPageBody extends StatelessWidget {
  const PretestPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          Container(
            color: Colors.white70,
            padding: const EdgeInsets.all(8.0),
          ),
          Container(
            color: Colors.white70,
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(232, 235, 242, 0.867), // Set your desired color,
                    borderRadius: BorderRadius.circular(12.0), // Border radius
                  ),
                  child: IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.circleCheck,
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
                  Navigator.pushNamed(context, '/courses/vid_lesson');
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(26, 92, 229, 0.867), // Set your desired background color, // Set button color
                padding: const EdgeInsets.symmetric(vertical: 4.0), // Set padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.0), // Rounded edges
                ),
              ),
              child: const Text(
                'Go Next',
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
    );
  }
}
