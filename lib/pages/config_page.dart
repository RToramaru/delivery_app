import 'package:delivery_app/controllers/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeController>(context);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Configurações',
            style: TextStyle(color: CupertinoColors.systemRed)),
      ),
      child: Container(
        color: theme.isDark ? CupertinoColors.black : CupertinoColors.white,
        margin: const EdgeInsets.all(50),
        child: Column(
          children: [
            Row(
              children: [
                CupertinoSwitch(
                  value: theme.isDark,
                  onChanged: (value) {
                    Provider.of<ThemeController>(context, listen: false)
                              .changeTheme(value);
                  },
                ),
                Text('Tema escuro',
                    style: TextStyle(
                      color: theme.isDark ? CupertinoColors.white : CupertinoColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
