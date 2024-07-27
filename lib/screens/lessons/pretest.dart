import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/nav-footer.dart';

class PretestPage extends StatefulWidget {
  const PretestPage({super.key});

  @override
  _PretestPageState createState() => _PretestPageState();
}

class _PretestPageState extends State<PretestPage> {
  final List<Question> _questions = [
    Question(
      text: 'What is 1/2?',
      choices: ['0.2', '0.5', '0.75', '1.0'],
      correctAnswer: '0.5',
    ),
    Question(
      text: 'What is 2/4?',
      choices: ['0.2', '0.4', '0.5', '0.75'],
      correctAnswer: '0.5',
    ),
    // Add more questions here
  ];

  int _currentQuestionIndex = 0;
  String? _selectedChoice;
  bool _showNextButton = false;
  bool _showQuestions = false;

  void _selectChoice(String? choice) {
    setState(() {
      _selectedChoice = choice;
      _showNextButton = true;
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedChoice = null;
        _showNextButton = false;
      });
    } else {
      // All questions answered, navigate to results or another page
      Navigator.pushNamed(context, '/courses/vid_lesson');
    }
  }

  void _startQuestions() {
    setState(() {
      _showQuestions = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: const PretestPageHeader(),
      ),
      body: Column(
        children: [
          Expanded(
            child: _showQuestions
                ? SingleChildScrollView(
                    child: PretestPageBody(
                      question: _questions[_currentQuestionIndex],
                      selectedChoice: _selectedChoice,
                      onSelectChoice: _selectChoice,
                    ),
                  )
                : Center(
                    child: ElevatedButton(
                      onPressed: _startQuestions,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(26, 92, 229, 0.867), // Set button background color
                        textStyle: const TextStyle(
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      child: const Text('Go Next'),
                    ),
                  ),
          ),
          if (_showNextButton && _showQuestions)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(26, 92, 229, 0.867), // Set button background color
                ),
                child: const Text('Next'),
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
  final Question question;
  final String? selectedChoice;
  final void Function(String?) onSelectChoice;

  const PretestPageBody({
    required this.question,
    required this.selectedChoice,
    required this.onSelectChoice,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align all text to the left
      children: <Widget>[
        Container(
          color: Colors.white70,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            question.text,
            textAlign: TextAlign.left, // Align text to the left
            style: const TextStyle(
              fontSize: 24.0,
              color: Color.fromRGBO(13, 18, 28, 0.867),
              fontFamily: "Lexend",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        for (var choice in question.choices)
          RadioListTile<String>(
            title: Text(choice),
            value: choice,
            groupValue: selectedChoice,
            onChanged: onSelectChoice,
          ),
      ],
    );
  }
}

class Question {
  final String text;
  final List<String> choices;
  final String correctAnswer;

  Question({
    required this.text,
    required this.choices,
    required this.correctAnswer,
  });
}
