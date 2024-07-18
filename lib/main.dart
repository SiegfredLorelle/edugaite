import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => TestPage(),
        "/home": (context) => HomePage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      // home: const TestPage(title: 'EduGAIte'),
    );
  }
}

class TestPage extends StatefulWidget {
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
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text("EduGAIte"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()),);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.next_plan),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HomePage extends StatelessWidget {

  // final HomePageHeader header = HomePageHeader(); // Create the widget instance here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: HomePageHeader(),
      ),
      body: Center(
        child: Text('TODO: Content Body'),
      ),
    );
  }
}

class HomePageHeader extends StatelessWidget {
  Widget build (BuildContext context) {
    return Container(
      height: 60.0, // Set desired height
      color: Colors.white70,
      // margin: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0,),
      padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: <Widget> [
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
            ]
          ),
          IconButton(
            icon: Icon(Icons.search),
            color: const Color.fromARGB(255, 94, 58, 58),
            onPressed: () {
              // TODO: Handle settings button press
            },
          ),
        ],
      ),
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

