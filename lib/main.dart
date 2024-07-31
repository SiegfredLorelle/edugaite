import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:EduGAIte/audio/audio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
import 'screens/lessons/pretest-result.dart';
import 'screens/lessons/chat_lesson.dart';
import 'screens/lessons/chatbot.dart';
import 'screens/lessons/read_lesson.dart';
import 'screens/lessons/posttest.dart';
import 'screens/lessons/posttest-result.dart';

import 'package:EduGAIte/game/bloc/navigation_bloc.dart';
import 'package:EduGAIte/game/bloc/navigation_state.dart';
import 'screens/feedback.dart';
import 'screens/community.dart'; // Import the community page

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables from the root .env file
  await dotenv.load(fileName: ".env");

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
        BlocProvider(create: (_) => NavigationBloc()),
      ],
      child: BlocListener<NavigationBloc, NavigationState>(
        listener: (context, state) {
          final navigator = navigatorKey.currentState!;
          if (state is CoursePageState) {
            navigator.pushNamed('/courses');
          }
        },
        child: MaterialApp(
          navigatorKey: navigatorKey,
          initialRoute: "/",
          routes: {
            "/": (context) => const HomePage(),
            "/login": (context) => const LoginPage(),
            "/signup": (context) => const SignUpPage(),
            "/game": (context) => const GameScreen(),
            "/profile": (context) => const ProfilePage(),
            "/track": (context) => const TrackPage(),
            "/courses": (context) => const CoursesPage(),
            "/courses/pretest": (context) => const PretestResultPage(),
            // "/courses/pretest-result": (context) => const PretestResultPage(),
            "/courses/vid_lesson": (context) => const VidLessonPage(),
            "/courses/chat_lesson": (context) => const ChatLessonPage(),
            "/courses/chatbot": (context) => const ChatbotPage(),
            "/courses/read_lesson": (context) => const ReadLessonPage(),
            "/courses/posttest": (context) => const PosttestPage(),
            // "/courses/posttest-result": (context) => const PosttestResultPage(),
            "/feedback": (context) => FeedbackPage(),
            "/community": (context) =>
                CommunityPage(), // Add the community page route
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
      ),
    );
  }
}
