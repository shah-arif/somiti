import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:somiti/screens/home_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey)),
      debugShowCheckedModeBanner: false,
      home:
      // HomeScreen()


      HomeScreen()
    );
  }
}
