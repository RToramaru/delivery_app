import 'package:delivery_app/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppRoutes extends StatelessWidget {
  const AppRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: GlobalCupertinoLocalizations.delegates,
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemRed,
        brightness: Brightness.light
      ),
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginPage(),
      },
      home:  const LoginPage(),
    );
  }
}