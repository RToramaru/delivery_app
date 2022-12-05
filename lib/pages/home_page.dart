import 'package:badges/badges.dart';
import 'package:delivery_app/controllers/items_cart_controller.dart';
import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/pages/fragments/cart_fragment.dart';
import 'package:delivery_app/pages/fragments/favorites_fragment.dart';
import 'package:delivery_app/pages/fragments/historic_fragment.dart';
import 'package:delivery_app/pages/fragments/home_fragment.dart';
import 'package:delivery_app/pages/fragments/profile_fragment.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> screens = [
    const HomeFragment(),
    const HistoricFragment(),
    const ProfileFragment(),
    const FavoritesFragment(),
    const CartFragment()
  ];

  @override
  Widget build(BuildContext context) {
    List<ProductModel> itemsCar =
        Provider.of<ItemsCarController>(context).items;
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'Principal'),
          const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.text_badge_checkmark),
              label: 'Histórico'),
          const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_circle), label: 'Perfil'),
          const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: 'Favoritos'),
          BottomNavigationBarItem(
              icon: Badge(
                 badgeContent: Text(itemsCar.length.toString()),
                 badgeColor: CupertinoColors.white,
                child: const Icon(CupertinoIcons.bag)), label: 'Carrinho'),
        ]),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return CupertinoPageScaffold(
                child: screens[index],
              );
            },
          );
        });
  }
}
