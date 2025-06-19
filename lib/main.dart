import 'package:catbreeds/router/router.dart';
import 'package:flutter/material.dart';

void main() {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const CatBreedsApp());
}

class CatBreedsApp extends StatelessWidget {
  const CatBreedsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CatBreeds',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
