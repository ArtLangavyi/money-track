import 'package:flutter/material.dart';

import '../../model/chart/pie_chart_view_model.dart';
import '../Expences/expence_list_by_period.dart';
import '../charts/pie_chart.dart';

class ExpenceOverviewTab extends StatelessWidget {
  const ExpenceOverviewTab({Key? key}) : super(key: key);

  PieCahrtViewModel get getPieCahrtViewModel {
    return PieCahrtViewModel(expectedValue: 800, value: 165);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PieChartWidget(getPieCahrtViewModel, 'Euro'),
        ExpenceListByPeriodView()
      ],
    );
  }
}
