import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uniconnect/firebase_options.dart';
import 'package:uniconnect/screens/anasayfa.dart';
import 'package:uniconnect/screens/dersdisi.dart';
import 'package:uniconnect/screens/dersici.dart';
import 'package:uniconnect/screens/login.dart';
import 'package:uniconnect/screens/splash.dart';
import 'package:uniconnect/screens/welcome.dart';
import 'package:uniconnect/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
