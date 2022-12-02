import 'package:flutter/cupertino.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Criar conta',
              style: TextStyle(color: CupertinoColors.systemRed)),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 50, left: 50, right: 50),
          child: ListView(
            children: [
              const CupertinoTextField(
                placeholder: 'Nome',
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(width: 0.0, color: CupertinoColors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const CupertinoTextField(
                placeholder: 'Email',
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(width: 0.0, color: CupertinoColors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const CupertinoTextField(
                placeholder: 'Senha',
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(width: 0.0, color: CupertinoColors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CupertinoTextField(
                placeholder: 'Telefone',
                inputFormatters: [
                  MaskedInputFormatter('(##) #####-####'),
                ],
                keyboardType: TextInputType.number,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(width: 0.0, color: CupertinoColors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const CupertinoTextField(
                placeholder: 'Endereço',
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(width: 0.0, color: CupertinoColors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CupertinoTextField(
                placeholder: 'Cartão de crédito',
                inputFormatters: [
                  MaskedInputFormatter('#### #### #### ####'),
                ],
                keyboardType: TextInputType.number,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(width: 0.0, color: CupertinoColors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CupertinoButton.filled(
                child: const Text('Criar conta'),
                onPressed: () {
                  _showAlertDialog(context);
                },
              ),
            ],
          ),
        ));
  }

  void _showAlertDialog(BuildContext context) {
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
  }
}
