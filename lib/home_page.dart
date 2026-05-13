import 'package:flutter/material.dart';
import 'package:simple_navigation_mock/detail_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // 観光地リスト
  final List<String> touristSpots = [
    '鶴ヶ城',
    '大内宿',
    '猪苗代湖',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fukushima Navi'),
      ),

      body: ListView.builder(
        itemCount: touristSpots.length,

        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(touristSpots[index]),

              onTap: () {
                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      spotName: touristSpots[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}