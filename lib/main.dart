import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:EduGAIte/audio/audio.dart';
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
import 'package:EduGAIte/game/bloc/navigation_bloc.dart';
import 'package:EduGAIte/game/bloc/navigation_state.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
            "/courses/pretest": (context) => const PretestPage(),
            "/courses/vid_lesson": (context) => const VidLessonPage(),
          },
          title: 'EduGAIte',
          theme: ThemeData(
            colorScheme: const ColorScheme(
              primary: Colors.white70,
              primaryContainer: Colors.white70,
              secondary: Colors.white70,
              secondaryContainer: Colors.white70,
              surface: Colors.white,
              error: Colors.red,
              onPrimary: Color.fromRGBO(13, 18, 28, 0.867),
              onSecondary: Color.fromRGBO(13, 18, 28, 0.867),
              onSurface: Colors.black,
              onError: Colors.white,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
