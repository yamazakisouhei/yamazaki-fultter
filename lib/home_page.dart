import 'package:flutter/material.dart';
import 'package:simple_navigation_mock/detail_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(),
              ),
            );
          },
          child: const Text('詳細画面へ'),
        ),
      ),
    );
  }
}
