import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  final TextStyle optionStyle;

  const HomeWidget({super.key, required this.optionStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Index 0: Home',
      style: optionStyle,
    );
  }
}
