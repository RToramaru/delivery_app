import 'package:delivery_app/controllers/theme_controller.dart';
import 'package:delivery_app/pages/about_page.dart';
import 'package:delivery_app/pages/config_page.dart';
import 'package:delivery_app/pages/create_user.dart';
import 'package:delivery_app/pages/home_page.dart';
import 'package:delivery_app/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class AppRoutes extends StatelessWidget {
  const AppRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeController>(context);
    return CupertinoApp(
      localizationsDelegates: GlobalCupertinoLocalizations.delegates,
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      theme:  CupertinoThemeData(
        primaryColor: CupertinoColors.systemRed,
        brightness: theme.isDark? Brightness.dark : Brightness.light,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/create_user': (context) => const CreateUser(),
        '/about': (context) => const AboutPage(),
        '/config': (context) => const ConfigPage(),
      },
      home:  const LoginPage(),
    );
  }
}