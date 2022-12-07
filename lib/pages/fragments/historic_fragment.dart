import 'package:delivery_app/controllers/purchase_controller.dart';
import 'package:delivery_app/controllers/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoricFragment extends StatefulWidget {
  const HistoricFragment({Key? key}) : super(key: key);

  @override
  State<HistoricFragment> createState() => _HistoricFragmentState();
}

class _HistoricFragmentState extends State<HistoricFragment> {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeController>(context);
    var purchaseList = Provider.of<PurchaseController>(context).purchases;
    return Column(
      children: [
        const Text('Histórico',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.systemRed)),
        Expanded(
          child: ListView.builder(
            itemCount: purchaseList.length,
            itemBuilder: (context, index) {
              return Container(
                color: theme.isDark ? CupertinoColors.black : CupertinoColors.white,
                margin: const EdgeInsets.all(10),
                child: Card(
                  color: theme.isDark ? CupertinoColors.black : CupertinoColors.white,
                  child: ListTile(
                    leading: Icon(CupertinoIcons.shopping_cart,
                        size: 30, color: theme.isDark ? CupertinoColors.white : CupertinoColors.black),
                    title: Text('Pedido ${purchaseList[index].id}', style:TextStyle(color: theme.isDark ? CupertinoColors.white : CupertinoColors.black,)
),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0;
                            i < purchaseList[index].items.length;
                            i++) ...[
                          Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(purchaseList[index].items[i].name,
                                  style:  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: theme.isDark ? CupertinoColors.white : CupertinoColors.black,))),
                          Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text('Preço R\$ ${purchaseList[index].items[i].price}', style:TextStyle(color: theme.isDark ? CupertinoColors.white : CupertinoColors.black,)
)),
                        ],
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text('Total do pedido R\$ ${purchaseList[index].price}', style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: theme.isDark ? CupertinoColors.white : CupertinoColors.black,))),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
