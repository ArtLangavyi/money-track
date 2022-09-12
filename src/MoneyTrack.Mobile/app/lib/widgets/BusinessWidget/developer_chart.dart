import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../model/Widgets/developer_series.dart';

class DeveloperChart extends StatelessWidget {
  final List<DeveloperSeries> data;

  const DeveloperChart({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<DeveloperSeries, String>> series = [
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (DeveloperSeries series, _) => series.year,
          measureFn: (DeveloperSeries series, _) => series.developers,
          colorFn: (DeveloperSeries series, _) => series.barColor)
    ];

    return Container(
      height: 300,
      padding: const EdgeInsets.all(25),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              Text(
                "Yearly Growth in the Flutter Community",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
