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

  Future<void> _nextQuestion() async {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedChoice = null;
        _showNextButton = false;
      });
    } else {
      // All questions answered, navigate to results or another page
      final bool? result = await _showExitConfirmationDialog(
          context, 'This marks the last question in pretest.\nDo you want to submit?',
          invertColors: false);
      if (result == true) {
        Navigator.pushNamed(context, '/courses/vid_lesson');
      }
    }
  }

  Future<void> _previousQuestion() async {
    if (!_showQuestions) {
      Navigator.of(context).pop();
      return;
    }

    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
        _selectedChoice = null;
        _showNextButton = false;
      });
    } else {
      final bool? result = await _showExitConfirmationDialog(
          context, 'Are you sure you want to leave?\nYour progress will be lost?',
          invertColors: true);
      if (result == true) {
        setState(() {
          _showQuestions = false;
          _selectedChoice = null;
          _showNextButton = false;
        });
      }
    }
  }

  Future<void> _startQuestions() async {
    setState(() {
      _showQuestions = true;
    });
  }

  Future<bool?> _showExitConfirmationDialog(BuildContext context, String message, {required bool invertColors}) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Confirmation',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            message,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: invertColors ? const Color.fromRGBO(26, 92, 229, 0.867) : Colors.transparent,
                foregroundColor: invertColors ? Colors.white : const Color.fromRGBO(13, 18, 28, 0.867),
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: invertColors ? Colors.transparent : const Color.fromRGBO(26, 92, 229, 0.867),
                foregroundColor: invertColors ? const Color.fromRGBO(13, 18, 28, 0.867) : Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  Future<bool?> _showExitConfirmationForNavLinks(BuildContext context) {
    return _showExitConfirmationDialog(
        context, 'Are you sure you want to leave pretest?\nYour progress will be lost.',
        invertColors: true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final bool? result = await _showExitConfirmationForNavLinks(context);
        return result ?? false;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: PretestPageHeader(
            onBackButtonPressed: _previousQuestion,
            isFirstQuestion: _currentQuestionIndex == 0 && _showQuestions,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: _showQuestions
                  ? SingleChildScrollView(
                      child: PretestPageBody(
                        question: _questions[_currentQuestionIndex],
                        questionNumber: _currentQuestionIndex + 1,
                        selectedChoice: _selectedChoice,
                        onSelectChoice: _selectChoice,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Welcome to the Pretest',
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
                            'This pretest will help us understand your current knowledge level.',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: "Lexend",
                              color: const Color.fromRGBO(13, 18, 28, 0.867),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Please answer the following questions to the best of your ability.',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: "Lexend",
                              color: const Color.fromRGBO(13, 18, 28, 0.867),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 32.0),
                          ElevatedButton(
                            onPressed: _startQuestions,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(26, 92, 229, 0.867), // Set button background color
                              textStyle: const TextStyle(
                                fontFamily: "Lexend",
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            child: const Text('Start test'),
                          ),
                        ],
                      ),
                    ),
            ),
            if (!_showQuestions) const NavFooter(),
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
          ],
        ),
      ),
    );
  }
}

class PretestPageHeader extends StatelessWidget {
  final VoidCallback onBackButtonPressed;
  final bool isFirstQuestion;

  const PretestPageHeader({
    required this.onBackButtonPressed,
    required this.isFirstQuestion,
    super.key,
  });

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
              icon: FaIcon(
                isFirstQuestion ? FontAwesomeIcons.times : FontAwesomeIcons.arrowLeft,
                size: 20,
              ),
              color: const Color.fromRGBO(13, 18, 28, 0.867),
              onPressed: onBackButtonPressed,
            ),
          ),
          Center(
            child: Text(
              'Pretest',
              style: const TextStyle(
                fontSize: 24.0,
                color: Color.fromRGBO(13, 18, 28, 0.867),
                fontFamily: "Lexend",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class PretestPageBody extends StatelessWidget {
  final Question question;
  final int questionNumber;
  final String? selectedChoice;
  final void Function(String?) onSelectChoice;

  const PretestPageBody({
    required this.question,
    required this.questionNumber,
    required this.selectedChoice,
    required this.onSelectChoice,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final choiceLabels = ['A', 'B', 'C', 'D'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align all text to the left
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              child: Text(
                'Question $questionNumber',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Color.fromRGBO(26, 92, 229, 0.867),
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Container(
          color: Colors.white70,
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
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
        for (var i = 0; i < question.choices.length; i++)
          InkWell(
            onTap: () => onSelectChoice(question.choices[i]),
            child: Container(
              width: double.infinity,
              height: 70.0, // Increase the height of each choice container
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              decoration: BoxDecoration(
                color: selectedChoice == question.choices[i] ? const Color.fromRGBO(26, 92, 229, 0.867) : const Color.fromRGBO(232, 235, 242, 0.867), // Set your desired background color
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: [
                  Text(
                    '${choiceLabels[i]}. ',
                    style: TextStyle(
                      color: selectedChoice == question.choices[i] ? Colors.white70 : const Color.fromRGBO(13, 18, 28, 0.867),
                      fontFamily: "Lexend",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      question.choices[i],
                      style: TextStyle(
                        color: selectedChoice == question.choices[i] ? Colors.white70 : const Color.fromRGBO(13, 18, 28, 0.867),
                        fontFamily: "Lexend",
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
