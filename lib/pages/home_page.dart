import 'package:delivery_app/pages/fragments/home_fragment.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> screens = [
    HomeFragment(),
    const Text('Histórico'),
    const Text('Perfil'),
    const Text('Favoritos'),
    const Text('Carrinho'),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'Principal'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.text_badge_checkmark),
              label: 'Histórico'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_circle), label: 'Perfil'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: 'Favoritos'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bag), label: 'Carrinho'),
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
