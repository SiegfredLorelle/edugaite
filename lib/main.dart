import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const TestPage(),
        "/home": (context) => const HomePage(),
        "/login": (context) => const LoginPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      // home: const TestPage(title: 'EduGAIte'),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  // const TestPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // final String title;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: const Text("EduGAIte"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '!!!TEST PAGE!!!: Click bottom right btn to start',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.next_plan),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // final HomePageHeader header = HomePageHeader(); // Create the widget instance here

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: HomePageHeader(),
      ),
      // body: Center(
      // //   // child: Text('TODO: Content Body'),
      // //   child: Image(image: AssetImage('assets/images/home-hero.png')),
      // // ),
      body: HomePageBody(),
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
      // margin: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0,),
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
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
            color: const Color.fromARGB(255, 94, 58, 58),
            onPressed: _openSearch,
          ),
        ],
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});
  

  @override
  Widget build(BuildContext context) {
    int currentYear = DateTime.now().year;

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            const Image(image: AssetImage('assets/images/home-hero.png')),
            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: const Text(
                "Empowering Teachers, Enhancing Education",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                  color: Color.fromRGBO(13, 18, 28, 0.867),
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: const Text(
                "Gamified, AI-powered training for Math and Science teachers",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromRGBO(13, 18, 28, 0.867),
                  fontFamily: "Lexend",
                ),
              ),
            ),
            Container(
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: Row(children: <Widget>[
                TextButton(
                  onPressed: () {
                    // Handle login logic here (e.g., form validation, authentication)
                  },
                  child: const Text('Get Started'),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(26, 92, 229,
                        0.867), // Set your desired background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Customize button shape
                    ),
                    foregroundColor: const Color.fromRGBO(
                        232, 235, 242, 0.867), // Set your desired color here
                    textStyle: const TextStyle(
                      fontSize: 12.0, // Set text size
                      fontFamily: "Lexend",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // Handle login logic here (e.g., form validation, authentication)
                  },
                  child: const Text('Sign In'),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(232, 235, 242,
                        0.867), // Set your desired background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Customize button shape
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
              ]),
            ),
            Container(
              width: double.infinity,
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              child: const Text(
                "Why EduGAIte for schools?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromRGBO(13, 18, 28, 0.867),
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const ImageCarousel(),

            Container(
              width: double.infinity,
              color: Colors.white70,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.xTwitter),
                    color: const Color.fromARGB(255, 94, 58, 58),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.linkedinIn),
                    color: const Color.fromARGB(255, 94, 58, 58),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.copyright,
                    size: 12.0,
                    color: Colors.black,
                  ),
                  Text(
                    '$currentYear EduGAIte, Inc. All rights reserved.',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontFamily: "Lexend",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70, // Set your desired background color here
      child: CarouselSlider(
        items: [
          CarouselItem(
              imagePath: 'assets/images/home-carousel/carousel-1.png',
              caption: 'Learn New Skills'),
          CarouselItem(
              imagePath: 'assets/images/home-carousel/carousel-2.png',
              caption: 'Earn Badges'),
          CarouselItem(
              imagePath: 'assets/images/home-carousel/carousel-3.png',
              caption: 'Get job-ready'),
        ],
        options: CarouselOptions(
          height: 250.0,
          enlargeCenterPage: false,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.5,
        ),
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final String imagePath;
  final String caption;

  const CarouselItem(
      {required this.imagePath, required this.caption, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(5.0),
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            caption,
            style: const TextStyle(
              color: const Color.fromRGBO(13, 18, 28, 0.867),
              fontSize: 16.0,
              backgroundColor: Colors.white70,
              fontFamily: "Lexend",
            ),
          ),
        ),
      ],
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
