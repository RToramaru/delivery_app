import 'package:delivery_app/controllers/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeController>(context);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Sobre o aplicativo',
            style: TextStyle(color: CupertinoColors.systemRed)),
      ),
      child: ListView(children: [
        SafeArea(
          child: Container(
            color: theme.isDark ? CupertinoColors.black : CupertinoColors.white,
            margin: const EdgeInsets.all(50),
            child: Column(
              children:  [
                Text(
                  'Sobre',
                  style: TextStyle(
                    color: CupertinoColors.systemRed,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Delivery App é um aplicativo de delivery de comida que ao acessar a conta é possível favoritar os produtos, fazer pedido, alterar dados de contato, verificar historico de pedidos e muito mais.\n\nO aplicativo foi desenvolvido por RToramaru.',
                  style: TextStyle(
                    color: theme.isDark ? CupertinoColors.white : CupertinoColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
