import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:EduGAIte/audio/audio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'firebase_options.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'game/view/game_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:EduGAIte/game/game.dart';
import 'screens/profile.dart';
import 'screens/track.dart';
import 'screens/courses.dart';
import 'screens/lessons/vid_lesson.dart';
import 'screens/signup.dart';
import 'screens/lessons/pretest.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AudioController()),
        BlocProvider(create: (_) => GameBloc()),
      ],
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) => const HomePage(),
          "/login": (context) => const LoginPage(),
          "/signup": (context) => const SignUpPage(),
          "/game": (context) => const GameScreen(),
          "/profile": (context) => const ProfilePage(),
          "/track": (context) => const TrackPage(),
          "/courses": (context) => const CoursesPage(),
          "/courses/pretest": (context) => const PretestPage(),
          "/courses/vid_lesson": (context) => const VidLessonPage(),
        },
        title: 'EduGAIte',
        theme: ThemeData(
          colorScheme: const ColorScheme(
            primary: Colors.white70, // Primary color
            primaryContainer: Colors.white70, // Primary container color
            secondary: Colors.white70, // Secondary color
            secondaryContainer: Colors.white70, // Secondary container color
            surface: Colors.white, // Surface color
            error: Colors.red, // Error color
            onPrimary: Color.fromRGBO(
                13, 18, 28, 0.867), // Text color on primary color
            onSecondary: Color.fromRGBO(
                13, 18, 28, 0.867), // Text color on secondary color
            onSurface: Colors.black, // Text color on surface color
            onError: Colors.white, // Text color on error color
            brightness: Brightness.light, // Brightness of the overall theme
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}