import 'package:catbreeds/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const ProviderScope(child: CatBreedsApp()));
}

class CatBreedsApp extends StatelessWidget {
  const CatBreedsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CatBreeds',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
