import 'package:delivery_app/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
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
              backgroundColor: CupertinoColors.white,
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
              margin: const EdgeInsets.only(
                  top: 210, left: 50, right: 50, bottom: 50),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: CupertinoTextField(
                      controller: userController.fieldTextUserEmail,
                      placeholder: 'Email',
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 0.0, color: CupertinoColors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: CupertinoTextField(
                      controller: userController.fieldTextUserPassword,
                      obscureText: true,
                      obscuringCharacter: '*',
                      placeholder: 'Senha',
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 0.0, color: CupertinoColors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: CupertinoButton.filled(
                      child: const Text('Entrar'),
                      onPressed: () async {
                        if (userController.fieldTextUserEmail.text.isEmpty ||
                            userController.fieldTextUserPassword.text.isEmpty) {
                          showCupertinoModalPopup<void>(
                            context: context,
                            builder: (BuildContext context) =>
                                CupertinoAlertDialog(
                              title: const Text('Erro!'),
                              content: const Text(
                                  'Usuário e senha são obrigatórios!'),
                              actions: <CupertinoDialogAction>[
                                CupertinoDialogAction(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        } else if (await userController.checkUser(
                            userController.fieldTextUserEmail.text,
                            userController.fieldTextUserPassword.text)) {
                          Navigator.pushNamed(context, '/home');
                        } else {
                          showCupertinoModalPopup<void>(
                            context: context,
                            builder: (BuildContext context) =>
                                CupertinoAlertDialog(
                              title: const Text('Erro!'),
                              content:
                                  const Text('Usuário ou senha inválidos!'),
                              actions: <CupertinoDialogAction>[
                                CupertinoDialogAction(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: CupertinoButton(
                      child: const Text('Criar conta'),
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
