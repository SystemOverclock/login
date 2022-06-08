import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
