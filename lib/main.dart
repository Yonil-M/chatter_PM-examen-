import 'package:chatter/screens/home.dart';
import 'package:chatter/temas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      title: "Messenger",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

//min 1.8.15