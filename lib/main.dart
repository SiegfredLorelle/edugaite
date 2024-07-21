import 'package:flutter/material.dart';

import 'screens/home.dart'; // Import the image carousel file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        colorScheme: const ColorScheme(
          primary: Colors.white70, // Primary color
          primaryContainer: Colors.white70, // Primary container color
          secondary: Colors.white70, // Secondary color
          secondaryContainer: Colors.white70, // Secondary container color
          surface: Colors.white, // Surface color
          error: Colors.red, // Error color
          onPrimary: Color.fromRGBO(13, 18, 28, 0.867), // Text color on primary color
          onSecondary: Color.fromRGBO(13, 18, 28, 0.867), // Text color on secondary color
          onSurface: Colors.black, // Text color on surface color
          onError: Colors.white, // Text color on error color
          brightness: Brightness.light, // Brightness of the overall theme
        ),
        useMaterial3: true,
      ),
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
                MaterialPageRoute(builder: (context) => LoginPage()),
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

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
