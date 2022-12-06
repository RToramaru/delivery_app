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
    var user = Provider.of<UserController>(context).user;
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(children: [
        Row(
          children: [
            const Icon(CupertinoIcons.person_alt_circle,
                size: 50, color: CupertinoColors.black),
            Text(user.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  leading: const Icon(CupertinoIcons.phone,
                      size: 30, color: CupertinoColors.black),
                  title: const Text('Telefone'),
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
                              child: const Text('Salvar'),
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
                      : Text(user.phone),
                  trailing: IconButton(
                      icon: const Icon(CupertinoIcons.pencil,
                          size: 30, color: CupertinoColors.black),
                      onPressed: () {
                        setState(() {
                          userController.updatePhone = true;
                        });
                      }),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(CupertinoIcons.location,
                      size: 30, color: CupertinoColors.black),
                  title: const Text('Endereço'),
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
                              child: const Text('Salvar'),
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
                      : Text(user.address),
                  trailing: IconButton(
                      icon: const Icon(CupertinoIcons.pencil,
                          size: 30, color: CupertinoColors.black),
                      onPressed: () {
                        setState(() {
                          userController.updateAddress = true;
                        });
                      
                      }),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(CupertinoIcons.creditcard,
                      size: 30, color: CupertinoColors.black),
                  title: const Text('Cartão de crédito'),
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
                              child: const Text('Salvar'),
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
                      : Text(user.card),
                  trailing: IconButton(
                      icon: const Icon(CupertinoIcons.pencil,
                          size: 30, color: CupertinoColors.black),
                      onPressed: () {
                        setState(() {
                          userController.updateCard = true;
                        });
                      }),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(CupertinoIcons.lock,
                      size: 30, color: CupertinoColors.black),
                  title: const Text('Senha'),
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
                              child: const Text('Salvar'),
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
                      : Text(user.password),
                  trailing: IconButton(
                      icon: const Icon(CupertinoIcons.pencil,
                          size: 30, color: CupertinoColors.black),
                      onPressed: () {
                        setState(() {
                          userController.updatePassword = true;
                        });
                      }),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Card(
                  child: ListTile(
                    leading: Icon(CupertinoIcons.settings,
                        size: 30, color: CupertinoColors.black),
                    title: Text('Configurações'),
                    subtitle: Text('Configurações do aplicativo'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Card(
                  child: ListTile(
                    leading: Icon(CupertinoIcons.info,
                        size: 30, color: CupertinoColors.black),
                    title: Text('Sobre'),
                  ),
                ),
              ),
              CupertinoButton(child: const Text('Sair'), onPressed: () {
                Navigator.of(context, rootNavigator: true).pushReplacementNamed('/login');
              }),
            ],
          ),
        ))
      ]),
    );
  }
}
