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
            'Geometry is a branch of mathematics that deals with shapes, sizes, and properties of space. In this lesson, you will explore various geometric shapes such as quadrilaterals, which are four-sided figures including squares, rectangles, and trapezoids. Understanding angles is crucial, as the sum of the interior angles of a triangle is always 180 degrees. You will also learn to calculate the perimeter of shapes, such as a square, which is four times the length of one side. Different types of angles include acute angles, which are less than 90 degrees. Symmetry is another important concept, with shapes like a regular pentagon having five lines of symmetry. You will identify polygons based on the number of sides they have, such as a hexagon which has six sides. The sum of the interior angles of a quadrilateral is always 360 degrees. In the study of circles, the diameter is twice the length of the radius. Parallel lines, which never meet and are always the same distance apart, are another key topic. Finally, you will learn about different types of triangles, including scalene triangles, which have all sides of different lengths.',
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: "Lexend",
              color: const Color.fromRGBO(13, 18, 28, 0.867),
            ),
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
