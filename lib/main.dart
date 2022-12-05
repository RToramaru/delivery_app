import 'package:delivery_app/controllers/favorite_controller.dart';
import 'package:delivery_app/controllers/items_cart_controller.dart';
import 'package:delivery_app/controllers/purchase_controller.dart';
import 'package:delivery_app/controllers/user_controller.dart';
import 'package:delivery_app/firebase_options.dart';
import 'package:delivery_app/pages/routes/app_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FavoriteController()),
    ChangeNotifierProvider(create: (_) => ItemsCarController()),
    ChangeNotifierProvider(create: (_) => UserController()),
  ], child: const AppRoutes()));
}
