import 'package:catbreeds/widgets/header_widget.dart';
import 'package:catbreeds/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Durations.medium4).then((_) {
      FlutterNativeSplash.remove();
    });
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD0D0D0), Color(0xFFE0E0E0), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(flex: 2, child: HeaderWidget()),
            Expanded(flex: 1, child: SearchBarWidget()),
            Expanded(flex: 17, child: Container()),
          ],
        ),
      ),
    );
  }
}
