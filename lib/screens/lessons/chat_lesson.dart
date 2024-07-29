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
        child: const ChatLessonPageHeader(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: const ChatLessonPageBody(),
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
              'VARK Learning Style',
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

class ChatLessonPageBody extends StatelessWidget {
  const ChatLessonPageBody({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Welcome to the Aural Learning Chat',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Lexend",
              color: const Color.fromRGBO(13, 18, 28, 0.867),
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 16.0),
          Text(
            'In this session, you will engage with an interactive chatbot designed for aural learners. The chatbot will guide you through various topics, providing auditory explanations and responses.',
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: "Lexend",
              color: const Color.fromRGBO(13, 18, 28, 0.867),
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 16.0),
          Text(
            'Feel free to listen to the chatbot and respond using your voice or text. This will help you reinforce your learning through auditory engagement.',
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: "Lexend",
              color: const Color.fromRGBO(13, 18, 28, 0.867),
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/courses/chatbot");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(26, 92, 229, 0.867), // Set button background color
              textStyle: const TextStyle(
                fontFamily: "Lexend",
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            child: const Text('Start Chat Session'),
          ),
        ],
      ),
    );
  }
}
