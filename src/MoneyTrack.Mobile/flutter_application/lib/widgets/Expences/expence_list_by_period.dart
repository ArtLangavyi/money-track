import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../model/views/expence_list_item_view_model.dart';

class ExpenceListByPeriodView extends StatelessWidget {
  final List<ExpenceListItemViewMode> expences = List.generate(
    20,
    (index) => ExpenceListItemViewMode(
        title: "Expence Item Overview Title",
        amount: 10.55,
        orderId: 0,
        orderDate: DateTime.now()),
  );

  ExpenceListByPeriodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ListTile(
          leading: Icon(Icons.monetization_on_outlined),
          title: Text('Expences for last month'),
          subtitle: Text('This is list of order for current month'),
        ),
        SizedBox(
            height: 188,
            child: ListView.builder(
                itemCount: expences.length,
                prototypeItem: ListTile(
                  title: Text(expences.first.title),
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {},
                    leading: const Icon(Icons.payments_outlined),
                    title: Text(
                      "${expences[index].title} ${expences[index].amount}  ${expences[index].orderDate.toString()}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    subtitle: const Text('TBD: maybe some subtitle?'),
                  );
                })),
      ],
    ));
  }
}
