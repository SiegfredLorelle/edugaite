import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/nav-footer.dart';

class ChatbotPage extends StatelessWidget {
  const ChatbotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: ChatbotPageHeader(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: ChatbotPageBody(),
            ),
          ),
          const NavFooter(),
        ],
      ),
    );
  }
}

class ChatbotPageHeader extends StatelessWidget {
  const ChatbotPageHeader({super.key});

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
              'Chatbot',
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

class ChatbotPageBody extends StatelessWidget {
  const ChatbotPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: TextButton(
                onPressed: () {
                  // TODO
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
