import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import '../../widgets/nav-footer.dart';

class ReadLessonPage extends StatelessWidget {
  const ReadLessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: const ReadLessonPageHeader(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: const ReadLessonPageBody(),
            ),
          ),
          // const NavFooter(),
        ],
      ),
    );
  }
}

class ReadLessonPageHeader extends StatelessWidget {
  const ReadLessonPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
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
              'VARK Learning Style',
              style: TextStyle(
                fontSize: 24.0,
                color: const Color.fromRGBO(13, 18, 28, 0.867),
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

class ReadLessonPageBody extends StatelessWidget {
  const ReadLessonPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Readings',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Lexend",
              color: const Color.fromRGBO(13, 18, 28, 0.867),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            """
Algebra is a branch of mathematics that deals with symbols and the rules for manipulating those symbols to solve equations and understand relationships between quantities. In this lesson, you will explore various algebraic concepts such as simplifying expressions, solving equations, and evaluating expressions. Understanding variables is crucial, as they represent unknown values that we aim to solve for.

You will learn to combine like terms, which is essential for simplifying expressions like 2x + 3x to 5x. Solving equations involves finding the value of the variable that makes the equation true, such as solving x + 5 = 10 to get x = 5. Evaluating expressions means substituting given values for variables, like evaluating 3a when a = 4 to get 12.

You will also learn to distribute terms, a process used to simplify expressions like 3(x + 4) to 3x + 12. Combining like terms, such as in the expression 4y + 3 - 2y + 5, results in 2y + 8. Understanding and solving linear equations, like 2y - 4 = 10, helps in finding the value of y.

In addition, substitution is a key concept where you replace variables with their values, such as finding the value of 4x + 1 when x = 2, resulting in 9. Working with exponents, like simplifying 2^3 to 8, is another fundamental algebraic skill. Finally, you will explore inequalities, such as solving x - 3 > 2 to get x > 5, which involves understanding the relationships between different quantities.

Algebra is not just about finding the correct answer; it’s about understanding the processes and relationships that help us model and solve real-world problems.
            """,
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: "Lexend",
              color: const Color.fromRGBO(13, 18, 28, 0.867),
              height: 1.5, // Adjust line height for readability
            ),
            textAlign: TextAlign.justify, // Justify text alignment
          ),
          SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/courses/posttest");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(26, 92, 229, 0.867),
              textStyle: const TextStyle(
                fontFamily: "Lexend",
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            child: const Text('Proceed to Next?'),
          ),
        ],
      ),
    );
  }
}
