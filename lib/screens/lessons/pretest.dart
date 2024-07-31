import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../../widgets/nav-footer.dart';
import '../../services/database_service.dart';
import '../../models/question_model.dart';
import './pretest-result.dart';  // Import the ResultPage

class PretestResultPage extends StatefulWidget {
  const PretestResultPage({super.key});

  @override
  _PretestResultPageState createState() => _PretestResultPageState();
}

class _PretestResultPageState extends State<PretestResultPage> {
  List<Question> _questions = [];
  int _currentQuestionIndex = 0;
  String? _selectedChoice;
  bool _showNextButton = false;
  bool _showQuestions = false;
  bool _isLoading = true;
  List<int> _scoreArray = [];  // Array to track score
  List<String?> _selectedChoices = []; // Array to track selected choices

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      // Update these values to match your desired path
      final String grade = '7';
      final String subject = 'mathematics';
      final String topic = 'algebra';
      final String level = 'basic';

      final questions = await DatabaseService().fetchQuestions(grade, subject, topic, level);
      setState(() {
        _questions = questions;
        _scoreArray = List.filled(questions.length, 0); // Initialize the score array
        _selectedChoices = List.filled(questions.length, null); // Initialize the selected choices array
        _isLoading = false;
      });
    } catch (e) {
      print('Failed to load questions: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _selectChoice(String? choice) {
    setState(() {
      _selectedChoice = choice;
      _selectedChoices[_currentQuestionIndex] = choice; // Save the selected choice
      _showNextButton = true;
    });
  }

  Future<void> _nextQuestion() async {
    if (_selectedChoice == _questions[_currentQuestionIndex].correct_answer) {
      _scoreArray[_currentQuestionIndex] = 1; // Mark the question as correct
    } else {
      _scoreArray[_currentQuestionIndex] = 0; // Mark the question as incorrect
    }

    int lastQuestionNumber = _questions.length - 1;
    if (_currentQuestionIndex < lastQuestionNumber) {
      setState(() {
        _currentQuestionIndex++;
        _selectedChoice = _selectedChoices[_currentQuestionIndex]; // Restore the selected choice
        _showNextButton = _selectedChoice != null;
      });
    } else {
      final bool? result = await _showExitConfirmationDialog(context,
          'This marks the last question in pretest.\nDo you want to submit?',
          invertColors: false);
      if (result == true) {
        int correctAnswers = _scoreArray.reduce((a, b) => a + b); // Calculate total correct answers
        // Navigate to the ResultPage with the score data
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              correctAnswers: correctAnswers,
              totalQuestions: _questions.length,
            ),
          ),
        );
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
        _selectedChoice = _selectedChoices[_currentQuestionIndex]; // Restore the selected choice
        _showNextButton = _selectedChoice != null;
      });
    } else {
      final bool? result = await _showExitConfirmationDialog(context,
          'Are you sure you want to leave?\nYour progress will be lost?',
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
      _currentQuestionIndex = 0;
      _selectedChoice = null;
      _scoreArray = List.filled(_questions.length, 0); // Reset the score array
      _selectedChoices = List.filled(_questions.length, null); // Reset the selected choices array    
    });
  }

  Future<bool?> _showExitConfirmationDialog(
      BuildContext context, String message,
      {required bool invertColors}) {
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
                backgroundColor: invertColors
                    ? const Color.fromRGBO(26, 92, 229, 0.867)
                    : Colors.transparent,
                foregroundColor: invertColors
                    ? Colors.white
                    : const Color.fromRGBO(13, 18, 28, 0.867),
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: invertColors
                    ? Colors.transparent
                    : const Color.fromRGBO(26, 92, 229, 0.867),
                foregroundColor: invertColors
                    ? const Color.fromRGBO(13, 18, 28, 0.867)
                    : Colors.white,
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
    return _showExitConfirmationDialog(context,
        'Are you sure you want to leave pretest?\nYour progress will be lost.',
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
          child: PretestResultPageHeader(
            onBackButtonPressed: _previousQuestion,
            isFirstQuestion: _currentQuestionIndex == 0 && _showQuestions,
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: _showQuestions
                        ? SingleChildScrollView(
                            child: PretestResultPageBody(
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
                                    color:
                                        const Color.fromRGBO(13, 18, 28, 0.867),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height: 16.0),
                                Text(
                                  'This pretest will help us understand your current knowledge level.',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: "Lexend",
                                    color:
                                        const Color.fromRGBO(13, 18, 28, 0.867),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height: 16.0),
                                Text(
                                  'Please answer the following questions to the best of your ability.',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: "Lexend",
                                    color:
                                        const Color.fromRGBO(13, 18, 28, 0.867),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height: 32.0),
                                ElevatedButton(
                                  onPressed: _startQuestions,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromRGBO(
                                        26,
                                        92,
                                        229,
                                        0.867), // Set button background color
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
                  // if (!_showQuestions) const NavFooter(),
                  if (_showNextButton && _showQuestions)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: _nextQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(26, 92, 229,
                              0.867), // Set button background color
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

class PretestResultPageHeader extends StatelessWidget {
  final VoidCallback onBackButtonPressed;
  final bool isFirstQuestion;

  const PretestResultPageHeader({
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
                isFirstQuestion
                    ? FontAwesomeIcons.times
                    : FontAwesomeIcons.arrowLeft,
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

class PretestResultPageBody extends StatelessWidget {
  final Question question;
  final int questionNumber;
  final String? selectedChoice;
  final void Function(String?) onSelectChoice;

  const PretestResultPageBody({
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
      crossAxisAlignment:
          CrossAxisAlignment.start,
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
            question.question,
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
              margin:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              decoration: BoxDecoration(
                color: selectedChoice == question.choices[i]
                    ? const Color.fromRGBO(26, 92, 229, 0.867)
                    : const Color.fromRGBO(232, 235, 242,
                        0.867), // Set your desired background color
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: [
                  Text(
                    '${choiceLabels[i]}. ',
                    style: TextStyle(
                      color: selectedChoice == question.choices[i]
                          ? Colors.white70
                          : const Color.fromRGBO(13, 18, 28, 0.867),
                      fontFamily: "Lexend",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      question.choices[i],
                      style: TextStyle(
                        color: selectedChoice == question.choices[i]
                            ? Colors.white70
                            : const Color.fromRGBO(13, 18, 28, 0.867),
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
