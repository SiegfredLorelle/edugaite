import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/nav-footer.dart';



class TrackPage extends StatelessWidget {
  const TrackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: TrackPageHeader(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: TrackPageBody(),
            ),
          ),
          const NavFooter(),
        ],
      ),        );
  }
}

class TrackPageHeader extends StatelessWidget {
  const TrackPageHeader({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0, // Set desired height
      color: Colors.white70,
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.bell, size: 20),
            color: const Color.fromRGBO(13, 18, 28, 0.867),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class TrackPageBody extends StatelessWidget {
  const TrackPageBody({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: const Text(
                "TRACK PAGE",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                  color: Color.fromRGBO(13, 18, 28, 0.867),
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
