import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Challenges',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3, // Adjust the aspect ratio to increase the height
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  ChallengeCard(
                    title: 'Back to School Challenge',
                    subtitle: 'Learn more',
                    imagePath: 'assets/images/home-hero.png',
                    onPressed: () {},
                  ),
                  ChallengeCard(
                    title: 'New Teacher Training',
                    subtitle: 'Explore',
                    imagePath: 'assets/images/home-hero.png',
                    onPressed: () {},
                  ),
                  ChallengeCard(
                    title: 'Teaching Gifted Students',
                    subtitle: 'Join',
                    imagePath: 'assets/images/home-hero.png',
                    onPressed: () {},
                  ),
                  ChallengeCard(
                    title: 'Classroom Management',
                    subtitle: 'Let\'s go!',
                    imagePath: 'assets/images/home-hero.png',
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

class ChallengeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback onPressed;

  const ChallengeCard({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                imagePath,
                width: double.infinity, // Span across the entire width of the card
                height: 120, // Set height as needed
                fit: BoxFit.cover, // Ensure the image covers the entire area
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54, // Darker shade for subtext
                    ),
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
