import 'package:delivery_app/controllers/items_cart_controller.dart';
import 'package:delivery_app/controllers/purchase_controller.dart';
import 'package:delivery_app/controllers/theme_controller.dart';
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
    var theme = Provider.of<ThemeController>(context);
    var purchaseController = Provider.of<PurchaseController>(context);
    UserModel user = Provider.of<UserController>(context).user;
    return ListView(
      children: [
        Container(
          color: theme.isDark ? CupertinoColors.black : CupertinoColors.white,
          margin: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Card(
              color:
                  theme.isDark ? CupertinoColors.black : CupertinoColors.white,
              child: ListTile(
                leading: Icon(CupertinoIcons.equal_square,
                    size: 30,
                    color: theme.isDark
                        ? CupertinoColors.white
                        : CupertinoColors.black),
                title: Text('Produtos',
                    style: TextStyle(
                      color: theme.isDark
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                    )),
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
                                          Text(itemsCar[i].name,
                                              style: TextStyle(
                                                color: theme.isDark
                                                    ? CupertinoColors.white
                                                    : CupertinoColors.black,
                                              )),
                                          Text('R\$ ${itemsCar[i].price}',
                                              style: TextStyle(
                                                color: theme.isDark
                                                    ? CupertinoColors.white
                                                    : CupertinoColors.black,
                                              )),
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
                                          icon: Icon(
                                            CupertinoIcons.trash,
                                            color: theme.isDark
                                                ? CupertinoColors.white
                                                : CupertinoColors.black,
                                          )),
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
              color:
                  theme.isDark ? CupertinoColors.black : CupertinoColors.white,
              child: ListTile(
                leading: Icon(CupertinoIcons.creditcard,
                    size: 30,
                    color: theme.isDark
                        ? CupertinoColors.white
                        : CupertinoColors.black),
                title: Text('Forma de Pagamento',
                    style: TextStyle(
                      color: theme.isDark
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                    )),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor: theme.isDark
                            ? CupertinoColors.white
                            : CupertinoColors.black,
                      ),
                      child: RadioListTile(           
                        contentPadding: const EdgeInsets.all(0),
                        title: Text("Dinheiro",
                            style: TextStyle(
                              color: theme.isDark
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                            )),
                        value: 'money',
                        groupValue: purchaseController.payment,
                        onChanged: (value) {
                          setState(() {
                            purchaseController.payment = value.toString();
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 50),
                      child: CupertinoTextField(
                        enabled: purchaseController.payment == 'money',
                        placeholder: 'Troco para',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor: theme.isDark
                            ? CupertinoColors.white
                            : CupertinoColors.black,
                      ),
                      child: RadioListTile(
                                  
                    
                        contentPadding: const EdgeInsets.all(0),
                        title: Text("Cartão",
                            style: TextStyle(
                              color: theme.isDark
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                            )),
                        value: 'card',
                        groupValue: purchaseController.payment,
                        onChanged: (value) {
                          setState(() {
                            purchaseController.payment = value.toString();
                          });
                        },
                      ),
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
                                Text('Cartão número: ${user.card}',
                                    style: TextStyle(
                                      color: theme.isDark
                                          ? CupertinoColors.white
                                          : CupertinoColors.black,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        purchaseController.alterPayment = true;
                                      });
                                    },
                                    icon: Icon(
                                      CupertinoIcons.pencil,
                                      color: theme.isDark
                                          ? CupertinoColors.white
                                          : CupertinoColors.black,
                                    )),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
            Card(
              color:
                  theme.isDark ? CupertinoColors.black : CupertinoColors.white,
              child: ListTile(
                leading: Icon(CupertinoIcons.location,
                    size: 30,
                    color: theme.isDark
                        ? CupertinoColors.white
                        : CupertinoColors.black),
                title: Text('Endereço de Entrega',
                    style: TextStyle(
                      color: theme.isDark
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                    )),
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
                            Text('Endereço: ${user.address}',
                                style: TextStyle(
                                  color: theme.isDark
                                      ? CupertinoColors.white
                                      : CupertinoColors.black,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    purchaseController.alterAddress = true;
                                  });
                                },
                                icon: Icon(
                                  CupertinoIcons.pencil,
                                  color: theme.isDark
                                      ? CupertinoColors.white
                                      : CupertinoColors.black,
                                )),
                          ],
                        ),
                      ),
              ),
            ),
            Card(
                color: theme.isDark
                    ? CupertinoColors.black
                    : CupertinoColors.white,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Informações do pedido',
                          style: TextStyle(
                            fontSize: 15,
                            color: theme.isDark
                                ? CupertinoColors.white
                                : CupertinoColors.black,
                          )),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subtotal',
                              style: TextStyle(
                                fontSize: 15,
                                color: theme.isDark
                                    ? CupertinoColors.white
                                    : CupertinoColors.black,
                              )),
                          itemsCar.isNotEmpty
                              ? Text(
                                  'R\$ ${itemsCar.map((e) => e.price).reduce((value, value2) => value + value2)}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: theme.isDark
                                        ? CupertinoColors.white
                                        : CupertinoColors.black,
                                  ))
                              : Text('R\$ 00,00',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: theme.isDark
                                        ? CupertinoColors.white
                                        : CupertinoColors.black,
                                  )),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Frete',
                              style: TextStyle(
                                fontSize: 15,
                                color: theme.isDark
                                    ? CupertinoColors.white
                                    : CupertinoColors.black,
                              )),
                          itemsCar.isNotEmpty
                              ? Text('R\$ 5,00',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: theme.isDark
                                        ? CupertinoColors.white
                                        : CupertinoColors.black,
                                  ))
                              : Text('R\$ 00,00',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: theme.isDark
                                        ? CupertinoColors.white
                                        : CupertinoColors.black,
                                  )),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: theme.isDark
                                    ? CupertinoColors.white
                                    : CupertinoColors.black,
                              )),
                          itemsCar.isNotEmpty
                              ? Text(
                                  'R\$ ${itemsCar.map((e) => e.price).reduce((value, value2) => value + value2) + 5}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: theme.isDark
                                        ? CupertinoColors.white
                                        : CupertinoColors.black,
                                  ))
                              : Text('R\$ 00,00',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: theme.isDark
                                        ? CupertinoColors.white
                                        : CupertinoColors.black,
                                  )),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: double.infinity,
                        child: CupertinoButton.filled(
                            child: Text('Finalizar pedido',
                                style: TextStyle(color: CupertinoColors.white)),
                            onPressed: () {
                              PurchaseModel p = PurchaseModel(
                                  items: itemsCar,
                                  payment: purchaseController.payment == 'money'
                                      ? 0
                                      : 1,
                                  address: purchaseController.alterAddress
                                      ? purchaseController.fieldTextAddress.text
                                      : user.address,
                                  price: itemsCar.map((e) => e.price).reduce(
                                          (value, value2) => value + value2) +
                                      5);

                              Provider.of<PurchaseController>(context,
                                      listen: false)
                                  .addPurchase(p.toMap());

                              Fluttertoast.showToast(
                                  msg: 'Pedido realizado com sucesso!',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              Provider.of<ItemsCarController>(context,
                                      listen: false)
                                  .clearItems();
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
