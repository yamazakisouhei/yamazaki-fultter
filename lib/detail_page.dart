import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String spotName;
  final String imagePath;

  const DetailPage({
    super.key,
    required this.spotName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(spotName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),

            Text(
              spotName,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              spotName == '鶴ヶ城'
                  ? '鶴ヶ城は会津若松市にある名城で、会津地方を代表する観光地です。'
                  : spotName == '大内宿'
                      ? '大内宿は江戸時代の宿場町の景観が残る人気観光地です。'
                      : '猪苗代湖は日本で4番目に大きい湖で、美しい景色が楽しめます。',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

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