import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../model/Widgets/developer_series.dart';
import './developer_chart.dart';

class BusinessWidget extends StatelessWidget {
  final List<DeveloperSeries> _data = [
    DeveloperSeries(
      year: "2017",
      developers: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "2018",
      developers: 5000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "2019",
      developers: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "2020",
      developers: 35000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "2021",
      developers: 45000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
  ];

  BusinessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DeveloperChart(
          data: _data,
        ),
      ),
    );
  }
}
