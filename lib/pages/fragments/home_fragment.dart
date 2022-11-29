// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset('assets/images/background.png',
                fit: BoxFit.cover, width: double.infinity, height: 200),
            Container(
              margin: const EdgeInsets.all(10),
              child: CupertinoSearchTextField(
                placeholder: 'Pesquisar',
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 50,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Icon(
                                  CupertinoIcons.star_fill,
                                  color: CupertinoColors.systemYellow,
                                  size: 15,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 5),
                                child: Icon(
                                  CupertinoIcons.star_fill,
                                  color: CupertinoColors.systemYellow,
                                  size: 15,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 5),
                                child: Icon(
                                  CupertinoIcons.star_fill,
                                  color: CupertinoColors.systemYellow,
                                  size: 15,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 5),
                                child: Icon(
                                  CupertinoIcons.star_lefthalf_fill,
                                  color: CupertinoColors.systemYellow,
                                  size: 15,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 5),
                                child: Icon(
                                  CupertinoIcons.star,
                                  color: CupertinoColors.systemYellow,
                                  size: 15,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: Text('3.5'),
                              ),
                            ],
                          ),
                          CupertinoButton(
                            onPressed: () {},
                            padding: const EdgeInsets.all(0),
                            child: Text('Adicionar'),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(CupertinoIcons.heart),
                        onPressed: () {},
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
