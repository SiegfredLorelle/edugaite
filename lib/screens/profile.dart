import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: HomePageHeader(),
      ),
      body: ProfilePageBody(),
    );
  }
}

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  void _openSearch() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0, // Set desired height
      color: Colors.white70,
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(children: <Widget>[
            Text(
              'Edu',
              style: TextStyle(
                fontSize: 24.0,
                color: Color.fromRGBO(221, 150, 12, 0.867),
                fontFamily: "Lexend",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'GAIte',
              style: TextStyle(
                fontSize: 24.0,
                color: Color.fromRGBO(35, 89, 197, 0.867),
                fontFamily: "Lexend",
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass, size: 20),
            color: const Color.fromRGBO(13, 18, 28, 0.867),
            onPressed: _openSearch,
          ),
        ],
      ),
    );
  }
}

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    int currentYear = DateTime.now().year;

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: const Text(
                "Welcome to the new school year!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                  color: Color.fromRGBO(13, 18, 28, 0.867),
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Image(image: AssetImage('assets/images/profile/profile.png')),
            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: Column(children: <Widget>[
                Text(
                  "Mrs. Johnson",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromRGBO(13, 18, 28, 0.867),
                    fontFamily: "Lexend",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Math Teacher",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: const Color.fromRGBO(
                        79, 102, 150, 1), // Label text color,
                    fontFamily: "Lexend",
                  ),
                ),
                Text(
                  "Joined 2020, 2nd year",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: const Color.fromRGBO(
                        79, 102, 150, 1), // Label text color,
                    fontFamily: "Lexend",
                  ),
                ),
              ]),
            ),
            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Share profile'),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(232, 235, 242,
                            0.867), // Set your desired background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12.0), // Customize button shape
                        ),
                        foregroundColor: const Color.fromRGBO(
                            13, 18, 28, 0.867), // Set your desired color here
                        textStyle: const TextStyle(
                          fontSize: 12.0, // Set text size
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0), // Add some spacing between the buttons
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Add Note'),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(26, 92, 229,
                            0.867), // Set your desired background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12.0), // Customize button shape
                        ),
                        foregroundColor: const Color.fromRGBO(232, 235, 242,
                            0.867), // Set your desired color here
                        textStyle: const TextStyle(
                          fontSize: 12.0, // Set text size
                          fontFamily: "Lexend",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              child: Text(
                "Quick Access",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromRGBO(13, 18, 28, 0.867),
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),



            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
              child: Row(
                children: <Widget>[
                  
                  Container(
                    decoration: BoxDecoration(
                      color:  const Color.fromRGBO(232, 235, 242, 0.867), // Set your desir,
                      borderRadius: BorderRadius.circular(12.0), // Border radius
                    ),
                    child: IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.bookOpen,
                        size: 16,
                      ),
                      color: const Color.fromRGBO(13, 18, 28, 0.867),
                      onPressed: () {},
                    ),
                  ),
                  
                  SizedBox(width: 8.0), // Add some spacing between the buttons

                  Text(
                    "Math Curriculum",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: const Color.fromRGBO(
                            13, 18, 28, 0.867), // Se
                      fontFamily: "Lexend",
                    ),
                  ),

                ],
              ),
            ),

            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
              child: Row(
                children: <Widget>[
                  
                  Container(
                    decoration: BoxDecoration(
                      color:  const Color.fromRGBO(232, 235, 242, 0.867), // Set your desir,
                      borderRadius: BorderRadius.circular(12.0), // Border radius
                    ),
                    child: IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.circlePlus,
                        size: 16,
                      ),
                      color: const Color.fromRGBO(13, 18, 28, 0.867),
                      onPressed: () {},
                    ),
                  ),
                  
                  SizedBox(width: 8.0), // Add some spacing between the buttons

                  Text(
                    "New Course",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: const Color.fromRGBO(
                            13, 18, 28, 0.867), // Se
                      fontFamily: "Lexend",
                    ),
                  ),

                ],
              ),
            ),

            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
              child: Row(
                children: <Widget>[
                  
                  Container(
                    decoration: BoxDecoration(
                      color:  const Color.fromRGBO(232, 235, 242, 0.867), // Set your desir,
                      borderRadius: BorderRadius.circular(12.0), // Border radius
                    ),
                    child: IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.userPlus,
                        size: 16,
                      ),
                      color: const Color.fromRGBO(13, 18, 28, 0.867),
                      onPressed: () {},
                    ),
                  ),
                  
                  SizedBox(width: 8.0), // Add some spacing between the buttons

                  Text(
                    "Add Track",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: const Color.fromRGBO(
                            13, 18, 28, 0.867), // Se
                      fontFamily: "Lexend",
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
