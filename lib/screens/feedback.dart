import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your students have submitted feedback on your teaching style and effectiveness. Here\'s a summary of the results.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20),
            Text(
              'Teaching Style',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildRatingSection('Teaching Style', 7.8, '+1%'),
            SizedBox(height: 20),
            _buildBarChart(['Lecture', 'Discussion', 'Group Work'], [6.0, 8.0, 4.0]),
            SizedBox(height: 30),
            Text(
              'Effectiveness',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildRatingSection('Effectiveness', 7.6, '-2%'),
            SizedBox(height: 20),
            _buildBarChart(['Clarity', 'Engagement', 'Learning'], [7.0, 6.0, 6.0]),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingSection(String title, double rating, String change) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16.0),
        ),
        Spacer(),
        Text(
          rating.toString(),
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 5),
        Text(
          'Last 4 weeks $change',
          style: TextStyle(fontSize: 14.0, color: change.startsWith('+') ? Colors.green : Colors.red),
        ),
      ],
    );
  }

  Widget _buildBarChart(List<String> labels, List<double> values) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(labels.length, (index) {
        return Column(
          children: [
            Text(labels[index]),
            SizedBox(height: 10),
            Container(
              width: 30,
              height: values[index] * 10,
              color: Colors.grey[300],
            ),
          ],
        );
      }),
    );
  }
}
