import 'package:flutter/cupertino.dart';

void showModal(String title, String message, BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('Erro!'),
      content: const Text('Usuário ou senha inválidos!'),
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
