import 'dart:convert';

import 'package:delivery_app/controllers/favorite_controller.dart';
import 'package:delivery_app/controllers/product_controller.dart';
import 'package:delivery_app/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesFragment extends StatefulWidget {
  const FavoritesFragment({Key? key}) : super(key: key);

  @override
  State<FavoritesFragment> createState() => _FavoritesFragmentState();
}

class _FavoritesFragmentState extends State<FavoritesFragment> {
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
        const Text('Favoritos',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.systemRed)),
        Expanded(
          child: ListView.builder(
              itemCount: favoriteControllerList.length,
              itemBuilder: (context, index) {
                ProductModel p = productController.products.firstWhere(
                    (element) =>
                        element.id == favoriteControllerList[index].id);
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
                            base64Decode(p.image),
                          ),
                          width: 150,
                          height: 150,
                        )),
                      ),
                      title: Text(p.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(p.description),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text('R\$ ${p.price}'),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                          icon: const Icon(CupertinoIcons.heart_fill,
                              size: 30, color: CupertinoColors.systemRed),
                          onPressed: () {
                            Provider.of<FavoriteController>(context,
                                    listen: false)
                                .removeFavorite(p.id);
                          }),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
