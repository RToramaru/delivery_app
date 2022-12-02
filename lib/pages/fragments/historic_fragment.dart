import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoricFragment extends StatefulWidget {
  const HistoricFragment({Key? key}) : super(key: key);

  @override
  State<HistoricFragment> createState() => _HistoricFragmentState();
}

class _HistoricFragmentState extends State<HistoricFragment> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 10, itemBuilder: (context, index) {
      return Container(
        margin: const EdgeInsets.all(10),
        child: Card(
          child: ListTile(
            leading: Icon(CupertinoIcons.shopping_cart,
                      size: 30, color: CupertinoColors.black),
            title: Text('Nome do produto'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('Data'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('R\$ 10,00'),
                ),
              ],
            ),
          ),
        ),
      );
    },);
  }
}