import 'package:flutter/material.dart';

import 'Home/ExpenceOverview.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  bottom:
                      const TabBar(indicatorColor: Colors.amberAccent, tabs: [
                    Tab(icon: Icon(Icons.monetization_on_rounded)),
                    Tab(icon: Icon(Icons.calendar_month_outlined)),
                    Tab(icon: Icon(Icons.shopping_basket)),
                  ]),
                ),
                body: const TabBarView(children: [
                  ExpenceOverviewTab(),
                  Text(
                    'Index 1: Calendar',
                    style: optionStyle,
                  ),
                  Text(
                    'Index 2: Shopping List',
                    style: optionStyle,
                  ),
                ]))));
  }
}
