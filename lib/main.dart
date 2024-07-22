import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/game_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/login": (context) => const LoginPage(),
        "/game": (context) => GameScreen(),
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
          onPrimary:
              Color.fromRGBO(13, 18, 28, 0.867), // Text color on primary color
          onSecondary: Color.fromRGBO(
              13, 18, 28, 0.867), // Text color on secondary color
          onSurface: Colors.black, // Text color on surface color
          onError: Colors.white, // Text color on error color
          brightness: Brightness.light, // Brightness of the overall theme
        ),
        useMaterial3: true,
      ),
    );
  }
}
