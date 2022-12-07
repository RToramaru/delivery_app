import 'package:delivery_app/controllers/favorite_controller.dart';
import 'package:delivery_app/controllers/purchase_controller.dart';
import 'package:delivery_app/controllers/theme_controller.dart';
import 'package:delivery_app/controllers/user_controller.dart';
import 'package:delivery_app/pages/widgets/text_field_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:provider/provider.dart';

class ProfileFragment extends StatefulWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeController>(context);
    var user = Provider.of<UserController>(context).user;
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(children: [
        Row(
          children: [
            Icon(CupertinoIcons.person_alt_circle,
                size: 50,
                color: theme.isDark
                    ? CupertinoColors.white
                    : CupertinoColors.black),
            Text(user.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: theme.isDark
                      ? CupertinoColors.white
                      : CupertinoColors.black,
                )),
          ],
        ),
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: ListView(
            children: [
              Card(
                color: theme.isDark
                    ? CupertinoColors.black
                    : CupertinoColors.white,
                child: ListTile(
                  leading: Icon(CupertinoIcons.phone,
                      size: 30,
                      color: theme.isDark
                          ? CupertinoColors.white
                          : CupertinoColors.black),
                  title: Text('Telefone',
                      style: TextStyle(
                        color: theme.isDark
                            ? CupertinoColors.white
                            : CupertinoColors.black,
                      )),
                  subtitle: userController.updatePhone
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            CupertinoTextField(
                              controller: userController.fieldTextUserPhone,
                              placeholder: 'Telefone',
                              inputFormatters: [
                                MaskedInputFormatter('(##) #####-####'),
                              ],
                              keyboardType: TextInputType.number,
                              padding: const EdgeInsets.all(16),
                              decoration: textFieldDecoration,
                            ),
                            CupertinoButton(
                              child: Text('Salvar',
                                  style: TextStyle(
                                      color: CupertinoColors.systemRed)),
                              onPressed: () {
                                userController.updatePhone = false;
                                Provider.of<UserController>(context,
                                        listen: false)
                                    .updateUserPhone(
                                  userController.fieldTextUserPhone.text,
                                );
                              },
                            )
                          ],
                        )
                      : Text(user.phone,
                          style: TextStyle(
                            color: theme.isDark
                                ? CupertinoColors.white
                                : CupertinoColors.black,
                          )),
                  trailing: IconButton(
                      icon: Icon(CupertinoIcons.pencil,
                          size: 30,
                          color: theme.isDark
                              ? CupertinoColors.white
                              : CupertinoColors.black),
                      onPressed: () {
                        setState(() {
                          userController.updatePhone = true;
                        });
                      }),
                ),
              ),
              Card(
                color: theme.isDark
                    ? CupertinoColors.black
                    : CupertinoColors.white,
                child: ListTile(
                  leading: Icon(CupertinoIcons.location,
                      size: 30,
                      color: theme.isDark
                          ? CupertinoColors.white
                          : CupertinoColors.black),
                  title: Text('Endereço',
                      style: TextStyle(
                          color: theme.isDark
                              ? CupertinoColors.white
                              : CupertinoColors.black)),
                  subtitle: userController.updateAddress
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            CupertinoTextField(
                              controller: userController.fieldTextUserAddress,
                              placeholder: 'Endereço',
                              padding: const EdgeInsets.all(16),
                              decoration: textFieldDecoration,
                            ),
                            CupertinoButton(
                              child: Text('Salvar',
                                  style: TextStyle(
                                      color: CupertinoColors.systemRed)),
                              onPressed: () {
                                userController.updateAddress = false;
                                Provider.of<UserController>(context,
                                        listen: false)
                                    .updateUserAddress(
                                  userController.fieldTextUserAddress.text,
                                );
                              },
                            )
                          ],
                        )
                      : Text(user.address,
                          style: TextStyle(
                            color: theme.isDark
                                ? CupertinoColors.white
                                : CupertinoColors.black,
                          )),
                  trailing: IconButton(
                      icon: Icon(CupertinoIcons.pencil,
                          size: 30,
                          color: theme.isDark
                              ? CupertinoColors.white
                              : CupertinoColors.black),
                      onPressed: () {
                        setState(() {
                          userController.updateAddress = true;
                        });
                      }),
                ),
              ),
              Card(
                color: theme.isDark
                    ? CupertinoColors.black
                    : CupertinoColors.white,
                child: ListTile(
                  leading: Icon(CupertinoIcons.creditcard,
                      size: 30,
                      color: theme.isDark
                          ? CupertinoColors.white
                          : CupertinoColors.black),
                  title: Text('Cartão de crédito',
                      style: TextStyle(
                        color: theme.isDark
                            ? CupertinoColors.white
                            : CupertinoColors.black,
                      )),
                  subtitle: userController.updateCard
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            CupertinoTextField(
                              controller: userController.fieldTextUserCard,
                              placeholder: 'Cartão de crédito',
                              inputFormatters: [
                                MaskedInputFormatter('#### #### #### ####'),
                              ],
                              keyboardType: TextInputType.number,
                              padding: const EdgeInsets.all(16),
                              decoration: textFieldDecoration,
                            ),
                            CupertinoButton(
                              child: Text('Salvar',
                                  style: TextStyle(
                                      color: CupertinoColors.systemRed)),
                              onPressed: () {
                                userController.updateCard = false;
                                Provider.of<UserController>(context,
                                        listen: false)
                                    .updateUserCard(
                                  userController.fieldTextUserCard.text,
                                );
                              },
                            )
                          ],
                        )
                      : Text(user.card,
                          style: TextStyle(
                            color: theme.isDark
                                ? CupertinoColors.white
                                : CupertinoColors.black,
                          )),
                  trailing: IconButton(
                      icon: Icon(CupertinoIcons.pencil,
                          size: 30,
                          color: theme.isDark
                              ? CupertinoColors.white
                              : CupertinoColors.black),
                      onPressed: () {
                        setState(() {
                          userController.updateCard = true;
                        });
                      }),
                ),
              ),
              Card(
                color: theme.isDark
                    ? CupertinoColors.black
                    : CupertinoColors.white,
                child: ListTile(
                  leading: Icon(CupertinoIcons.lock,
                      size: 30,
                      color: theme.isDark
                          ? CupertinoColors.white
                          : CupertinoColors.black),
                  title: Text('Senha',
                      style: TextStyle(
                        color: theme.isDark
                            ? CupertinoColors.white
                            : CupertinoColors.black,
                      )),
                  subtitle: userController.updatePassword
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            CupertinoTextField(
                              controller: userController.fieldTextUserPassword,
                              placeholder: 'Senha',
                              padding: const EdgeInsets.all(16),
                              decoration: textFieldDecoration,
                            ),
                            CupertinoButton(
                              child: Text('Salvar',
                                  style: TextStyle(
                                      color: CupertinoColors.systemRed)),
                              onPressed: () {
                                userController.updatePassword = false;
                                Provider.of<UserController>(context,
                                        listen: false)
                                    .updateUserPassword(
                                  userController.fieldTextUserPassword.text,
                                );
                              },
                            )
                          ],
                        )
                      : Text(user.password,
                          style: TextStyle(
                            color: theme.isDark
                                ? CupertinoColors.white
                                : CupertinoColors.black,
                          )),
                  trailing: IconButton(
                      icon: Icon(CupertinoIcons.pencil,
                          size: 30,
                          color: theme.isDark
                              ? CupertinoColors.white
                              : CupertinoColors.black),
                      onPressed: () {
                        setState(() {
                          userController.updatePassword = true;
                        });
                      }),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushReplacementNamed('/config');
                },
                child: Card(
                  color: theme.isDark
                      ? CupertinoColors.black
                      : CupertinoColors.white,
                  child: ListTile(
                    leading: Icon(CupertinoIcons.settings,
                        size: 30,
                        color: theme.isDark
                            ? CupertinoColors.white
                            : CupertinoColors.black),
                    title: Text('Configurações',
                        style: TextStyle(
                          color: theme.isDark
                              ? CupertinoColors.white
                              : CupertinoColors.black,
                        )),
                    subtitle: Text('Configurações do aplicativo',
                        style: TextStyle(
                          color: theme.isDark
                              ? CupertinoColors.white
                              : CupertinoColors.black,
                        )),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushReplacementNamed('/about');
                },
                child: Card(
                  color: theme.isDark
                      ? CupertinoColors.black
                      : CupertinoColors.white,
                  child: ListTile(
                    leading: Icon(CupertinoIcons.info,
                        size: 30,
                        color: theme.isDark
                            ? CupertinoColors.white
                            : CupertinoColors.black),
                    title: Text('Sobre',
                        style: TextStyle(
                          color: theme.isDark
                              ? CupertinoColors.white
                              : CupertinoColors.black,
                        )),
                  ),
                ),
              ),
              CupertinoButton(
                  child: const Text('Sair',
                      style: TextStyle(color: CupertinoColors.systemRed)),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushReplacementNamed('/login');
                  }),
            ],
          ),
        ))
      ]),
    );
  }
}
