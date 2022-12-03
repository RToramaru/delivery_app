import 'package:delivery_app/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Criar conta',
              style: TextStyle(color: CupertinoColors.systemRed)),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 50, left: 50, right: 50),
          child: ListView(
            children: [
              CupertinoTextField(
                controller: userController.fieldTextUserName,
                placeholder: 'Nome',
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(width: 0.0, color: CupertinoColors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CupertinoTextField(
                controller: userController.fieldTextUserEmail,
                placeholder: 'Email',
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(width: 0.0, color: CupertinoColors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CupertinoTextField(
                controller: userController.fieldTextUserPassword,
                placeholder: 'Senha',
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(width: 0.0, color: CupertinoColors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CupertinoTextField(
                controller: userController.fieldTextUserPhone,
                placeholder: 'Telefone',
                inputFormatters: [
                  MaskedInputFormatter('(##) #####-####'),
                ],
                keyboardType: TextInputType.number,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(width: 0.0, color: CupertinoColors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CupertinoTextField(
                controller: userController.fieldTextUserAddress,
                placeholder: 'Endereço',
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(width: 0.0, color: CupertinoColors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CupertinoTextField(
                controller: userController.fieldTextUserCard,
                placeholder: 'Cartão de crédito',
                inputFormatters: [
                  MaskedInputFormatter('#### #### #### ####'),
                ],
                keyboardType: TextInputType.number,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(width: 0.0, color: CupertinoColors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CupertinoButton.filled(
                child: const Text('Criar conta'),
                onPressed: () async {
                  if (await userController.createUser(
                      userController.fieldTextUserName.text,
                      userController.fieldTextUserEmail.text,
                      userController.fieldTextUserPassword.text,
                      userController.fieldTextUserPhone.text,
                      userController.fieldTextUserAddress.text,
                      userController.fieldTextUserCard.text)) {
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: const Text('Sucesso!'),
                        content: const Text('Conta criada com sucesso!'),
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
                  } else {
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: const Text('Erro!'),
                        content: const Text('Erro ao criar conta!'),
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
            ],
          ),
        ));
  }
}
