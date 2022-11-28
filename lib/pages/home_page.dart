import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> screens = [
    const Text('History'),
    const Text('Profile'),
    const Text('Home'),
    const Text('Profile'),
    const Text('Cart'),
  ];
  
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.text_badge_checkmark), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_circle), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bag), label: 'Cart'),
        ]),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return CupertinoPageScaffold(
                child: SafeArea(
                  child: screens[index],
                ),
              );
            },
          );
        });
  }
}
