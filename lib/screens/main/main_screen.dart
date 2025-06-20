import 'package:catbreeds/screens/main/widgets/header_widget.dart';
import 'package:catbreeds/screens/main/widgets/list_content_widget.dart';
import 'package:catbreeds/screens/main/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Durations.medium4).then((_) {
      FlutterNativeSplash.remove();
    });
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Hero(
              tag: 'header',
              child: HeaderWidget(headerText: 'CatBreeds'),
            ),
          ),
          Expanded(flex: 1, child: SearchBarWidget()),
          Expanded(flex: 17, child: ListContentWidget()),
        ],
      ),
    );
  }
}
