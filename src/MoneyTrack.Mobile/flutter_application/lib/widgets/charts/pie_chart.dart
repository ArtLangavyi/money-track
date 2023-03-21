import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:pie_chart/pie_chart.dart';
import '../../model/chart/pie_chart_view_model.dart';

class PieChartWidget extends StatefulWidget {
  final PieCahrtViewModel expenceCahrtViewModel;
  final String label;
  const PieChartWidget(this.expenceCahrtViewModel, this.label, {Key? key})
      : super(key: key);

  @override
  PieChartWidgetState createState() => PieChartWidgetState();
}

class PieChartWidgetState extends State<PieChartWidget> {
  late final dataMap;
  late final legendLabels;

  PieChartWidgetState();

  get key => 123;

  @override
  void initState() {
    dataMap = <String, double>{
      "Used": widget.expenceCahrtViewModel.value,
      "Expected": widget.expenceCahrtViewModel.expectedValue,
    };

    legendLabels = <String, String>{
      "Used": "Spent ${widget.expenceCahrtViewModel.value}",
      "Expected":
          "Verwacht per maand: ${widget.expenceCahrtViewModel.expectedValue}",
    };

    super.initState();
  }

  final colorList = <Color>[
    const Color.fromRGBO(129, 182, 205, 1),
    const Color.fromARGB(50, 180, 233, 1),
  ];

  final gradientList = <List<Color>>[
    [
      const Color.fromRGBO(129, 182, 205, 1),
      const Color.fromRGBO(1, 129, 182, 205),
    ],
    [
      const Color.fromARGB(255, 151, 150, 149),
      const Color(0xff0984e3),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: math.min(MediaQuery.of(context).size.width / 3.2, 100),
      colorList: [
        Theme.of(context).primaryColor,
        const Color.fromARGB(100, 112, 125, 131),
      ],
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      centerText: "${widget.expenceCahrtViewModel.value}",
      legendLabels: legendLabels,
      legendOptions: const LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.bottom,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: false,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
      ),
      ringStrokeWidth: 32,
      emptyColor: Colors.grey,
      gradientList: null, //gradientList,
      emptyColorGradient: const [
        Color(0xff6c5ce7),
        Colors.blue,
      ],
      baseChartColor: Colors.transparent,
    );

    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 32,
          ),
          child: chart,
        ),
      ],
    ));
  }
}
