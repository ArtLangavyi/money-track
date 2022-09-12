import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  final TextStyle optionStyle;

  const SettingsWidget({super.key, required this.optionStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Index 3: Settings',
      style: optionStyle,
    );
  }
}
