import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileFragment extends StatefulWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(children: [
        Row(
          children: [
            Icon(CupertinoIcons.person_alt_circle,
                size: 50, color: CupertinoColors.black),
            Text('Nome do usuário',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(CupertinoIcons.phone,
                      size: 30, color: CupertinoColors.black),
                  title: Text('Telefone'),
                  subtitle: Text('(00) 00000-0000'),
                  trailing: IconButton(
                      icon: Icon(CupertinoIcons.pencil,
                          size: 30, color: CupertinoColors.black),
                      onPressed: () {}),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(CupertinoIcons.location,
                      size: 30, color: CupertinoColors.black),
                  title: Text('Endereço'),
                  subtitle:
                      Text('Rua tal, 000, Bairro tal, Cidade tal, Estado tal'),
                  trailing: IconButton(
                      icon: Icon(CupertinoIcons.pencil,
                          size: 30, color: CupertinoColors.black),
                      onPressed: () {}),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(CupertinoIcons.creditcard,
                      size: 30, color: CupertinoColors.black),
                  title: Text('Cartão de crédito'),
                  subtitle: Text('0000 0000 0000 0000'),
                  trailing: IconButton(
                      icon: Icon(CupertinoIcons.pencil,
                          size: 30, color: CupertinoColors.black),
                      onPressed: () {}),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(CupertinoIcons.mail,
                      size: 30, color: CupertinoColors.black),
                  title: Text('E-mail'),
                  subtitle: Text('Email do usuário'),
                  trailing: IconButton(
                      icon: Icon(CupertinoIcons.pencil,
                          size: 30, color: CupertinoColors.black),
                      onPressed: () {}),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(CupertinoIcons.lock,
                      size: 30, color: CupertinoColors.black),
                  title: Text('Senha'),
                  subtitle: Text('********'),
                  trailing: IconButton(
                      icon: Icon(CupertinoIcons.pencil,
                          size: 30, color: CupertinoColors.black),
                      onPressed: () {}),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(CupertinoIcons.settings,
                      size: 30, color: CupertinoColors.black),
                  title: Text('Configurações'),
                  subtitle: Text('Configurações do aplicativo'),
                  trailing: IconButton(
                      icon: Icon(CupertinoIcons.pencil,
                          size: 30, color: CupertinoColors.black),
                      onPressed: () {}),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Card(
                  child: ListTile(
                    leading: Icon(CupertinoIcons.info,
                        size: 30, color: CupertinoColors.black),
                    title: Text('Sobre'),
                  ),
                ),
              ),
              CupertinoButton(child: Text('Sair'), onPressed: () {}),
            ],
          ),
        ))
      ]),
    );
  }
}
