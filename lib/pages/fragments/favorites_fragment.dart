import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FavoritesFragment extends StatefulWidget {
  const FavoritesFragment({Key? key}) : super(key: key);

  @override
  State<FavoritesFragment> createState() => _FavoritesFragmentState();
}

class _FavoritesFragmentState extends State<FavoritesFragment> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 10, itemBuilder: (context, index) {
      return Container(
        margin: const EdgeInsets.all(10),
        child: Card(
          child: ListTile(
            leading: Image.asset(
              'assets/images/background.png',
              width: 100,
              height: 100,
            ),
            title: Text('Nome do produto'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('Descrição do produto'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('R\$ 10,00'),
                ),
              ],
            ),
            trailing: IconButton(
                icon: Icon(CupertinoIcons.heart_fill,
                    size: 30, color: CupertinoColors.systemRed),
                onPressed: () {}),
          ),
        ),
      );
    });
  }
}