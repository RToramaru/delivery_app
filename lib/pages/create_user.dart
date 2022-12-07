import 'package:delivery_app/controllers/theme_controller.dart';
import 'package:delivery_app/controllers/user_controller.dart';
import 'package:delivery_app/pages/widgets/modal_widget.dart';
import 'package:delivery_app/pages/widgets/text_field_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/provider.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeController>(context);
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Criar conta',
              style: TextStyle(color: CupertinoColors.systemRed)),
        ),
        child: Container(
          color: theme.isDark ? CupertinoColors.black : CupertinoColors.white,
          margin: const EdgeInsets.only(top: 50, left: 50, right: 50),
          child: ListView(
            children: [
              CupertinoTextField(
                controller: userController.fieldTextUserName,
                placeholder: 'Nome',
                padding: const EdgeInsets.all(16),
                decoration: textFieldDecoration,
              ),
              const SizedBox(height: 20),
              CupertinoTextField(
                controller: userController.fieldTextUserEmail,
                placeholder: 'Email',
                keyboardType: TextInputType.emailAddress,
                padding: const EdgeInsets.all(16),
                decoration: textFieldDecoration,
              ),
              const SizedBox(height: 20),
              CupertinoTextField(
                controller: userController.fieldTextUserPassword,
                placeholder: 'Senha',
                padding: const EdgeInsets.all(16),
                decoration: textFieldDecoration,
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
                decoration: textFieldDecoration,
              ),
              const SizedBox(height: 20),
              CupertinoTextField(
                controller: userController.fieldTextUserAddress,
                placeholder: 'Endereço',
                padding: const EdgeInsets.all(16),
                decoration: textFieldDecoration,
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
                decoration: textFieldDecoration,
              ),
              const SizedBox(height: 20),
              CupertinoButton.filled(
                child: const Text('Criar conta', style:TextStyle(color:  CupertinoColors.white)),
                onPressed: () async {
                  if (await userController.createUser(
                      userController.fieldTextUserName.text,
                      userController.fieldTextUserEmail.text,
                      userController.fieldTextUserPassword.text,
                      userController.fieldTextUserPhone.text,
                      userController.fieldTextUserAddress.text,
                      userController.fieldTextUserCard.text)) {
                    showModal('Sucesso!', 'Conta criada com sucesso!', context);
                  } else {
                    showModal('Erro!', 'Erro ao criar conta!', context);
                  }
                },
              ),
            ],
          ),
        ));
  }
}
