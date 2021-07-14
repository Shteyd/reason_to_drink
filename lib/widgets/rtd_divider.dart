import 'package:flutter/material.dart';

class RTDDivider extends StatelessWidget {
  const RTDDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(width: 4),
      ),
      height: 10,
    );
  }
}
