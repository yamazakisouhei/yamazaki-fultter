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

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset(
  spotName == '鶴ヶ城'
      ? 'assets/images/turugazyou.jpg'
      : spotName == '大内宿'
          ? 'assets/images/ouchijuku.jpg'
          : 'assets/images/inawasiroko.jpg',
  height: 200,
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
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
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