import 'package:flutter/material.dart';
import 'package:learning_flutter_tools/second_screen.dart';
import './home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Home Page Title'),
        '/second': (context) => const SecondScreen()
      },
    );
  }
}
