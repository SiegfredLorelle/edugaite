import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LearningPathPage extends StatelessWidget {
  const LearningPathPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your learning path'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  ResourceItem(
                    title: 'New resource: How to create a...',
                    readTime: '1 min read',
                    timeAgo: '3 hours ago',
                    imagePath: 'assets/images/home-hero.png', // replace with your image path
                  ),
                  ResourceItem(
                    title: 'New resource: Teaching kids to...',
                    readTime: '2 min read',
                    timeAgo: '4 hours ago',
                    imagePath: 'assets/images/home-hero.png', // replace with your image path
                  ),
                  ResourceItem(
                    title: 'New resource: The art of asking...',
                    readTime: '3 min read',
                    timeAgo: '5 hours ago',
                    imagePath: 'assets/images/home-hero.png', // replace with your image path
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Assessments',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  AssessmentItem(
                    title: 'How do I get my students engaged?',
                    onPressed: () {},
                  ),
                  AssessmentItem(
                    title: 'How can I help my students?',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResourceItem extends StatelessWidget {
  final String title;
  final String readTime;
  final String timeAgo;
  final String imagePath;

  const ResourceItem({
    required this.title,
    required this.readTime,
    required this.timeAgo,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 60, // adjust as needed
            height: 60, // adjust as needed
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$readTime • $timeAgo',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AssessmentItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const AssessmentItem({
    required this.title,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              onPressed: onPressed,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                color: Color.fromRGBO(13, 18, 28, 0.867),
                fontFamily: "Lexend",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(232, 235, 242, 0.867),
              foregroundColor: const Color.fromRGBO(26, 92, 229, 0.867),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
            child: const Text('Start'),
          ),
        ],
      ),
    );
  }
}