import 'package:flutter/material.dart';
import '../widgets/MainMenu/MainMenu.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MainMenuStatefulWidget();
  }
}
