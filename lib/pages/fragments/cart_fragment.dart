// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartFragment extends StatefulWidget {
  const CartFragment({Key? key}) : super(key: key);

  @override
  State<CartFragment> createState() => _CartFragmentState();
}

class _CartFragmentState extends State<CartFragment> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Card(
              child: ListTile(
                leading: Icon(CupertinoIcons.equal_square,
                    size: 30, color: CupertinoColors.black),
                title: Text('produtos'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < 2; i++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Nome do produto'),
                                      Text('Descrição do produto'),
                                      Text('R\$ 10,00'),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(CupertinoIcons.trash)),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(CupertinoIcons.creditcard,
                    size: 30, color: CupertinoColors.black),
                title: Text('Forma de Pagamento'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RadioListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text("Dinheiro"),
                      value: 0,
                      groupValue: 0,
                      onChanged: (value) {
                        
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 50),
                      child: CupertinoTextField(
                        placeholder: 'Troco para',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    RadioListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text("Cartão"),
                      value: 1,
                      groupValue: 1, // igual para funcionar
                      onChanged: (value) {
                        
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 50),
                      child: CupertinoTextField(
                        placeholder: 'Número do cartão',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(CupertinoIcons.location,
                    size: 30, color: CupertinoColors.black),
                title: Text('Endereço de Entrega'),
                subtitle: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: CupertinoTextField(
                        placeholder: 'Endereço',
                      ),
                ),
              ),
            ),
            Card(
                child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Informações do pedido', style: TextStyle(fontSize: 15)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal', style: TextStyle(fontSize: 15)),
                      Text('R\$ 00,00', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Frete', style: TextStyle(fontSize: 15)),
                      Text('R\$ 00,00', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text('R\$ 00,00',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: double.infinity,
                    child: CupertinoButton.filled(
                        child: Text('Finalizar pedido'), onPressed: () {}),
                  )
                ],
              ),
            )),
          ]),
        ),
      ],
    );
  }
}
