import 'package:flutter/material.dart';

class RTDContainer extends StatelessWidget {
  final int index;
  const RTDContainer({
    Key? key,
    required this.listOfHolidays,
    required this.index,
  }) : super(key: key);

  final List<String> listOfHolidays;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 3),
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        child: Text(
          listOfHolidays[index],
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
