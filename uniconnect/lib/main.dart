import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uniconnect/Provider/provider.dart';
import 'package:uniconnect/custom_widgets/navigation_bar.dart';
import 'package:uniconnect/firebase_options.dart';
import 'package:uniconnect/screens/opening_page.dart';
import 'package:uniconnect/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        )
      ],
      child: MaterialApp(
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.active){
              if(snapshot.hasData){
                return A();
              }else if(snapshot.hasError){
                return Center(child: Text("${snapshot.error.toString()}"),);
              }
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            return SplashScreen();
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
