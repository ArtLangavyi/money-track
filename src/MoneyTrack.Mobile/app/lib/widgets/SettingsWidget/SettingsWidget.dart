import 'package:flutter/material.dart';

import '../PopUp/popup.dart';

class SettingsWidget extends StatelessWidget {
  final TextStyle optionStyle;

  const SettingsWidget({super.key, required this.optionStyle});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: PopUpWidget(),
      ),
    );
  }
}
