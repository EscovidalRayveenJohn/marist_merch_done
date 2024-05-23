import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maristcommerce/product_shop/cart_detail.dart';
import 'package:maristcommerce/product_shop/purchase_history.dart';
import 'package:maristcommerce/splash_screen.dart';
import 'package:maristcommerce/user_auth/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => PurchaseHistory()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
