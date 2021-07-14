import 'package:flutter/material.dart';
import 'package:reason_to_drink/screens/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Brightness darkMode = Brightness.light;
  bool darkModeOn = false;

  void checkCurrentTime() {
    final int hour = DateTime.now().hour;
    if (hour > 20 || hour < 6) {
      darkMode = Brightness.dark;
      darkModeOn = true;
    }
  }

  @override
  void initState() {
    super.initState();
    checkCurrentTime();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        primarySwatch: Colors.blue,
        brightness: darkMode,
      ),
      home: const MainScreen(),
    );
  }
}
