import 'package:delivery_app/controllers/items_cart_controller.dart';
import 'package:delivery_app/controllers/purchase_controller.dart';
import 'package:delivery_app/controllers/user_controller.dart';
import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/models/purchase_model.dart';
import 'package:delivery_app/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CartFragment extends StatefulWidget {
  const CartFragment({Key? key}) : super(key: key);

  @override
  State<CartFragment> createState() => _CartFragmentState();
}

class _CartFragmentState extends State<CartFragment> {
  @override
  Widget build(BuildContext context) {
    List<ProductModel> itemsCar =
        Provider.of<ItemsCarController>(context).items;
    var purchaseController = Provider.of<PurchaseController>(context);
    UserModel user = Provider.of<UserController>(context).user;
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Card(
              child: ListTile(
                leading: const Icon(CupertinoIcons.equal_square,
                    size: 30, color: CupertinoColors.black),
                title: const Text('Produtos'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < itemsCar.length; i++)
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(itemsCar[i].name),
                                          Text('R\$ ${itemsCar[i].price}'),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                          onPressed: () {
                                            Provider.of<ItemsCarController>(
                                                    context,
                                                    listen: false)
                                                .removeItems(itemsCar[i]);
                                          },
                                          icon:
                                              const Icon(CupertinoIcons.trash)),
                                    ),
                                  ],
                                ),
                                const Divider(),
                              ],
                            ),
                          const SizedBox(
                            height: 50,
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
                leading: const Icon(CupertinoIcons.creditcard,
                    size: 30, color: CupertinoColors.black),
                title: const Text('Forma de Pagamento'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RadioListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: const Text("Dinheiro"),
                      value: 'money',
                      groupValue: purchaseController.payment,
                      onChanged: (value) {
                        setState(() {
                          purchaseController.payment = value.toString();
                        });
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 50),
                      child: CupertinoTextField(
                        enabled: purchaseController.payment == 'money',
                        placeholder: 'Troco para',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    RadioListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: const Text("Cartão"),
                      value: 'card',
                      groupValue: purchaseController.payment,
                      onChanged: (value) {
                        setState(() {
                          purchaseController.payment = value.toString();
                        });
                      },
                    ),
                    purchaseController.alterPayment &&
                            purchaseController.payment == 'card'
                        ? Container(
                            margin: const EdgeInsets.only(left: 50),
                            child: CupertinoTextField(
                              controller: purchaseController.fieldTextCard,
                              placeholder: 'Número do cartão',
                              keyboardType: TextInputType.number,
                            ),
                          )
                        : Container(
                            margin: const EdgeInsets.only(left: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Cartão número: ${user.card}'),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        purchaseController.alterPayment = true;
                                      });
                                    },
                                    icon: const Icon(CupertinoIcons.pencil)),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(CupertinoIcons.location,
                    size: 30, color: CupertinoColors.black),
                title: const Text('Endereço de Entrega'),
                subtitle: purchaseController.alterAddress
                    ? Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const CupertinoTextField(
                          placeholder: 'Endereço',
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Endereço: ${user.address}'),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    purchaseController.alterAddress = true;
                                  });
                                },
                                icon: const Icon(CupertinoIcons.pencil)),
                          ],
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
                  const Text('Informações do pedido',
                      style: TextStyle(fontSize: 15)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Subtotal', style: TextStyle(fontSize: 15)),
                      itemsCar.isNotEmpty
                          ? Text(
                              'R\$ ${itemsCar.map((e) => e.price).reduce((value, value2) => value + value2)}',
                              style: const TextStyle(fontSize: 15))
                          : const Text('R\$ 00,00',
                              style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Frete', style: TextStyle(fontSize: 15)),
                      itemsCar.isNotEmpty
                          ? const Text('R\$ 5,00',
                              style: TextStyle(fontSize: 15))
                          : const Text('R\$ 00,00',
                              style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      itemsCar.isNotEmpty
                          ? Text(
                              'R\$ ${itemsCar.map((e) => e.price).reduce((value, value2) => value + value2) + 5}',
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))
                          : const Text('R\$ 00,00',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: double.infinity,
                    child: CupertinoButton.filled(
                        child: const Text('Finalizar pedido'),
                        onPressed: () {
                          PurchaseModel p = PurchaseModel(
                              items: itemsCar,
                              payment:
                                  purchaseController.payment == 'money' ? 0 : 1,
                              address: purchaseController.alterAddress
                                  ? purchaseController.fieldTextAddress.text
                                  : user.address,
                              price: itemsCar.map((e) => e.price).reduce(
                                      (value, value2) => value + value2) +
                                  5);

                          Provider.of<PurchaseController>(context, listen: false).addPurchase(p.toMap());

                          Fluttertoast.showToast(
                              msg: 'Pedido realizado com sucesso!',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        Provider.of<ItemsCarController>(context, listen: false).clearItems();
                        purchaseController.fieldTextAddress.clear();
                        purchaseController.fieldTextCard.clear();
                        
                        }),
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
