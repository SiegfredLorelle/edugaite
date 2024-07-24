import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/nav-footer.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: LessonPageHeader(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: LessonPageBody(),
            ),
          ),
          const NavFooter(),
        ],
      ),
    );
  }
}

class LessonPageHeader extends StatelessWidget {
  const LessonPageHeader({super.key});

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
              'AI Visualization',
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

class LessonPageBody extends StatelessWidget {
  const LessonPageBody({super.key});

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
            child: ImageGallery(),
          ),
        ],
      ),
    );
  }
}

class ImageGallery extends StatelessWidget {
  const ImageGallery({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace these paths with your image asset paths
    final List<String> imagePaths = [
      'assets/images/collect_eggs_acorns_instruction.png',
      'assets/images/home-carousel/carousel-1.png',
      'assets/images/game_logo.png',
      'assets/images/game_over_bg.png',
      'assets/images/portalInstruction.png',
      // Add new image paths here
    ];

    return GridView.builder(
      shrinkWrap: true, // Important to use in nested scrollable widgets
      physics: NeverScrollableScrollPhysics(), // Prevent grid view from scrolling
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 images per row
        crossAxisSpacing: 12.0, // Smaller gap between images
        mainAxisSpacing: 12.0, // Smaller gap between images
      ),
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10.0), // Round the corners
          child: SizedBox(
            width: 100, // Set desired width
            height: 100, // Set desired height
            child: Image.asset(
              imagePaths[index],
              fit: BoxFit.cover, // Ensure the image fits within the bounds
            ),
          ),
        );
      },
    );
  }
}
