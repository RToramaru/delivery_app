import 'package:delivery_app/controllers/purchase_controller.dart';
import 'package:delivery_app/controllers/theme_controller.dart';
import 'package:delivery_app/controllers/user_controller.dart';
import 'package:delivery_app/pages/widgets/modal_widget.dart';
import 'package:delivery_app/pages/widgets/text_field_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'package:delivery_app/controllers/favorite_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeController>(context);
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Stack(
          children: [
            WaveWidget(
              config: CustomConfig(
                colors: [CupertinoColors.systemRed],
                durations: [10000],
                heightPercentages: [0.2],
              ),
              backgroundColor: theme.isDark ? CupertinoColors.black : CupertinoColors.white,
              size: const Size(double.infinity, double.infinity),
              waveAmplitude: 20,
            ),
            Container(
              margin: const EdgeInsets.only(top: 100),
              width: double.infinity,
              child: const Text('Login',
                  style: TextStyle(
                      color: CupertinoColors.systemRed,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
            Card(
              color: theme.isDark ? CupertinoColors.black : CupertinoColors.white,
              margin: const EdgeInsets.only(
                  top: 210, left: 50, right: 50, bottom: 50),
              child: Column(
                children: [
                  Container(
                    color: theme.isDark ? CupertinoColors.black : CupertinoColors.white,
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: CupertinoTextField(
                      controller: userController.fieldTextUserEmail,
                      placeholder: 'Email',
                      padding: const EdgeInsets.all(16),
                      decoration: textFieldDecoration,
                    ),
                  ),
                  Container(
                    color: theme.isDark ? CupertinoColors.black : CupertinoColors.white,
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: CupertinoTextField(
                      controller: userController.fieldTextUserPassword,
                      obscureText: true,
                      obscuringCharacter: '*',
                      placeholder: 'Senha',
                      padding: const EdgeInsets.all(16),
                      decoration: textFieldDecoration,
                    ),
                  ),
                  Container(
                    color: theme.isDark ? CupertinoColors.black : CupertinoColors.white,
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: CupertinoButton.filled(
                      child: Text('Entrar', style:TextStyle(color:  CupertinoColors.white)),
                      onPressed: () async {
                        if (userController.fieldTextUserEmail.text.isEmpty ||
                            userController.fieldTextUserPassword.text.isEmpty) {
                          showModal(
                              'Erro!', 'Preencha todos os campos', context);
                        } else if (await userController.checkUser(
                            userController.fieldTextUserEmail.text,
                            userController.fieldTextUserPassword.text)) {
                          Provider.of<FavoriteController>(context,
                                  listen: false)
                              .configureCollection(
                                  userController.fieldTextUserEmail.text);

                          Provider.of<UserController>(context, listen: false)
                              .getUser(userController.fieldTextUserEmail.text);

                          Provider.of<PurchaseController>(context,
                                  listen: false).configureCollection(userController.fieldTextUserEmail.text);
                                  
                          Navigator.pushReplacementNamed(context, '/home');
                        } else {
                          showModal(
                              'Erro!', 'Usuário ou senha inválidos!', context);
                        }
                      },
                    ),
                  ),
                  Container(
                    color: theme.isDark ? CupertinoColors.black : CupertinoColors.white,
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: CupertinoButton(
                      child: Text('Criar conta', style:TextStyle(color: theme.isDark ? CupertinoColors.white : CupertinoColors.black,)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/create_user');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
