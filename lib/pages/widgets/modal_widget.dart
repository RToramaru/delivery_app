import 'package:flutter/cupertino.dart';

void showModal(String title, String message, BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
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
