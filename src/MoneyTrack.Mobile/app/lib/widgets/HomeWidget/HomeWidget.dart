import 'package:flutter/material.dart';

import '../piechart/PieChart.dart';

class HomeWidget extends StatelessWidget {
  final TextStyle optionStyle;

  const HomeWidget({super.key, required this.optionStyle});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: PieChartWidget(),
      ),
    );
  }
}
