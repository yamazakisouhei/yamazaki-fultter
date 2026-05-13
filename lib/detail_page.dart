import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String spotName;

  const DetailPage({
    super.key,
    required this.spotName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(spotName),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              spotName,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              '観光地の詳細情報を表示するページです。',
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text('戻る'),
            ),
          ],
        ),
      ),
    );
  }
}