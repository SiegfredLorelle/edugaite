import 'package:flutter/material.dart';

class TapToJumpOverlay extends StatelessWidget {
  const TapToJumpOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color.fromARGB(81, 177, 177, 177),
            ),
            color: const Color(0xE51B1B36),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Tap to Start', // Direct text instead of localized text
              style: textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
