
# Delivery App

  

## Sobre

  
O aplicativo Delivery App, é um aplicativo de delivery de comida, nele é possível adicionar usuario, fazer login, favoritar os produtos, fazer pedido, alterar dados de contato, alterar o tema do aplicativo, consultar historico de compra entre outros.

O projeto foi desenvolvido em Flutter com integracação com o Firebase


O projeto segue a arquitetura ``MVC`` (Model, View, Controller). Estando organizado no seguinte estilo de pastas:


```bash

📁delivery_app

┗ 📁lib

┗ 📁controller

┗ 📁faker

┗ 📁models

┗ 📁page

┗ 📜main.dart

```

  

https://user-images.githubusercontent.com/42619833/206304840-b2ce700c-e961-474d-a3a6-13124ce6922a.mp4


  

## Demonstração

![](/screens/1.png)
![](/screens/2.png)
![](/screens/3.png)
![](/screens/4.png)
![](/screens/5.png)
![](/screens/6.png)

  

## Clone do projeto

  
  

Para utilizar é necessário realizar o clone do repositório e instalar suas dependências, assim como subir um banco de dados faker com produtos.

  
```

https://github.com/RToramaru/delivery_app.git

cd delivery_app.git

flutter pub get

```

Após instalado as dependências é necessário realizar algumas configurações em relação ao Firebase.
  

1. Após o projeto criado habilitar o ``Cloud Firestore`` que servirá como o banco de dados do projeto.

  
  

2. Feito isso a próxima etapa é adicionar o projeto do Firebase ao aplicativo Flutter. Para isso existe duas maneiras possíveis.

	2.1. Através do console do Firebase, para isso é necessário seguir uma etapas.
	* Acessar as configurações do projeto.
	* Selecionar opção ``Adicionar aplicativo``
	* Registrar o App
	* Fazer o download do arquivo ``google-services`` e adicionar ao caminho ``android/app/``
	* Adicionar o SDK do Firebase no caminho ``android/build.gradle`` e no caminho ``android/app/build.gradle``
	
	2.2. Através do FIrebase CLI, para isso é necessário seguir uma etapas
	* Caso não tenha o FIrebase CLI instalado, pode se instalar através de duas formas
			* Binários do CLI para Windows através do link [Firebase CLI](https://firebase.tools/bin/win/instant/latest)
			* Através do npm

			npm install -g firebase-tools

	* Após intalado é necessário ativar o Firebase CLI e configurar no projeto.

		```
		dart pub global activate flutterfire_cli
		flutterfire configure
		```
	**OBS** Caso utilize a primeira opção o arquivo ``lib/main.dart`` deve ser alterado de
	```
	await Firebase.initializeApp(
	name: 'chat-app',
	options: DefaultFirebaseOptions.currentPlatform,
	);
	```
	para

	```
	await Firebase.initializeApp(
	name: 'chat-app',
	);
	```


Concluída todas essas etapas pode subir a base de dados faker, para isso é necessário alterar o arquivo ``lib/faker/product_faker.dart`` passando o o ``projectId`` para o campo ``Firestore.initialize``.

Após alterado o nome basta executar o seguinte script

```
dart run lib/faker/product_faker.dart
```

Após feita todas as etapas o aplicativo se encontra pronto para execução. Para isso execute o comando

````
flutter run
```

``@author Rafael Almeida``
