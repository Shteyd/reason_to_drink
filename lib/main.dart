import 'package:flutter/material.dart';
import 'package:reason_to_drink/presentation/screens/current_holidays_screen.dart';

void main() => runApp(const ReasonToDrinkApp());

class ReasonToDrinkApp extends StatelessWidget {
  const ReasonToDrinkApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        primarySwatch: Colors.teal,
      ),
      home: const MainScreen(),
    );
  }
}
