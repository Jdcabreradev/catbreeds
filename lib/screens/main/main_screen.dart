import 'package:catbreeds/shared/header_widget.dart';
import 'package:catbreeds/screens/main/widgets/list_content_widget.dart';
import 'package:catbreeds/screens/main/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Hero(tag: 'main-header', child: HeaderWidget()),
        ),
        Expanded(flex: 1, child: SearchBarWidget()),
        Expanded(flex: 17, child: ListContentWidget()),
      ],
    );
  }
}
