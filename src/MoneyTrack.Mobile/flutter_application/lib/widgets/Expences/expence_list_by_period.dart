import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../model/views/expence_list_item_view_model.dart';

class ExpenceListByPeriodView extends StatelessWidget {
  final List<ExpenceListItemViewMode> expences = List.generate(
    20,
    (index) => ExpenceListItemViewMode(
        title: "Expence Item Overview Title", amount: 10.55, orderId: 0),
  );

  ExpenceListByPeriodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Card(
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
                      expences[index].title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    subtitle: const Text('TBD: maybe some subtitle?'),
                  );
                })));
  }
}
