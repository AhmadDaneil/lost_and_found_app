import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'login.dart';
import 'home.dart'; // Import your Home screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const FoundItApp());
}

class FoundItApp extends StatelessWidget {
  const FoundItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoundIt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/home': (context) => const Home(),
      },
    );
  }
}
