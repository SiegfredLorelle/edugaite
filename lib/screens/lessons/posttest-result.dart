import 'package:flutter/material.dart';

class PosttestResultPage extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;

  const PosttestResultPage({
    required this.correctAnswers,
    required this.totalQuestions,
    super.key,
  });

  String _getRating(double percentage) {
    if (percentage >= 90) {
      return 'Excellent';
    } else if (percentage >= 75) {
      return 'Good';
    } else if (percentage >= 50) {
      return 'Fair';
    } else {
      return 'Needs Improvement';
    }
  }

  @override
  Widget build(BuildContext context) {
    double percentage = (correctAnswers / totalQuestions) * 100;
    String rating = _getRating(percentage);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: PosttestResultPageHeader(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Congratulations!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Lexend",
                color: const Color.fromRGBO(13, 18, 28, 0.867),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 16.0),
            Text(
              'You have completed the posttest.',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: "Lexend",
                color: const Color.fromRGBO(13, 18, 28, 0.867),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 32.0),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Your Score',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lexend",
                      color: const Color.fromRGBO(221, 150, 12, 0.867),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    '$correctAnswers / $totalQuestions',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lexend",
                      color: const Color.fromRGBO(26, 92, 229, 0.867),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Percentage: ${percentage.toStringAsFixed(2)}%',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Lexend",
                      color: const Color.fromRGBO(13, 18, 28, 0.867),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Rating: $rating',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Lexend",
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(221, 150, 12, 0.867),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                if (percentage >= 80) {
                  // Update to next lvl
                  Navigator.pushNamed(context, '/track');
                } else {
                  // lvl stays the same
                  Navigator.pushNamed(context, '/track');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(26, 92, 229, 0.867),
                textStyle: const TextStyle(
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              child: Text(percentage >= 80 ? 'Proceed to New Level' : 'Repeat Level'),
            ),
          ],
        ),
      ),
    );
  }
}

class PosttestResultPageHeader extends StatelessWidget {
  const PosttestResultPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0, // Set desired height
      color: Colors.white70,
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
      margin: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
      child: Center(
        child: Text(
          'Result',
          style: const TextStyle(
            fontSize: 24.0,
            color: Color.fromRGBO(13, 18, 28, 0.867),
            fontFamily: "Lexend",
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
