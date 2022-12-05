import 'dart:convert';

import 'package:delivery_app/controllers/favorite_controller.dart';
import 'package:delivery_app/controllers/product_controller.dart';
import 'package:delivery_app/models/favorite_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  ProductController productController = ProductController();

  @override
  void initState() {
    super.initState();
    getAllProducts();
    Provider.of<FavoriteController>(context, listen: false).getFavorites();
  }

  void getAllProducts() async {
    await productController.getProducts();
    setState(() {
      productController;
    });
  }

  @override
  Widget build(BuildContext context) {
    var favoriteControllerList =
        Provider.of<FavoriteController>(context).favorites;

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
              itemCount: productController.products.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: Card(
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Image(
                            image: ResizeImage(
                          MemoryImage(
                            base64Decode(
                                productController.products[index].image),
                          ),
                          width: 150,
                          height: 150,
                        )),
                      ),
                      title: Text(productController.products[index].name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                                productController.products[index].description),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                                'R\$ ${productController.products[index].price}'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (var i = 0;
                                  i <
                                      productController.products[index].stars
                                          .toInt();
                                  i++)
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Icon(
                                    CupertinoIcons.star_fill,
                                    color: CupertinoColors.systemYellow,
                                    size: 15,
                                  ),
                                ),
                              if (productController.products[index].stars
                                      .round() >
                                  productController.products[index].stars
                                      .toInt())
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 10, left: 5),
                                  child: Icon(
                                    CupertinoIcons.star_lefthalf_fill,
                                    color: CupertinoColors.systemYellow,
                                    size: 15,
                                  ),
                                ),
                              for (int i = 0;
                                  i <
                                      5 -
                                          productController
                                              .products[index].stars
                                              .round();
                                  i++)
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 10, left: 5),
                                  child: Icon(
                                    CupertinoIcons.star,
                                    color: CupertinoColors.systemYellow,
                                    size: 15,
                                  ),
                                ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                    '${productController.products[index].stars}'),
                              ),
                            ],
                          ),
                          CupertinoButton(
                            onPressed: () {},
                            padding: const EdgeInsets.all(0),
                            child: const Text('Adicionar'),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: favoriteControllerList
                                .map((e) =>
                                    e.id ==
                                    productController.products[index].id)
                                .contains(true)
                            ? const Icon(CupertinoIcons.heart_fill, color: Colors.red)
                            : const Icon(CupertinoIcons.heart, color: Colors.red),
                        onPressed: () {
                          if (favoriteControllerList
                              .map((e) =>
                                  e.id == productController.products[index].id)
                              .contains(true)) {
                            Provider.of<FavoriteController>(context,
                                    listen: false)
                                .removeFavorite(
                                    favoriteControllerList[index].id);
                          } else {
                            Provider.of<FavoriteController>(context,
                                    listen: false)
                                .addFavorite(FavoriteModel(
                                    id: productController.products[index].id));
                          }
                        },
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
