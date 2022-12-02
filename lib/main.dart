import 'package:delivery_app/firebase_options.dart';
import 'package:delivery_app/pages/routes/app_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'Delivery-app',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppRoutes());
}


