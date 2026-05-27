import 'package:flutter/material.dart';
import 'package:simple_navigation_mock/detail_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // 観光地リスト
  final List<Map<String, String>> touristSpots = [
  {
    'name': '鶴ヶ城',
    'image': 'assets/images/turugazyou.jpg',
  },
  {
    'name': '大内宿',
    'image': 'assets/images/ouchijuku.jpg',
  },
  {
    'name': '猪苗代湖',
    'image': 'assets/images/inawasiroko.jpg',
  },
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
              leading: Image.asset(
                touristSpots[index]['image']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),

              title: Text(touristSpots[index]['name']!),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                     spotName: touristSpots[index]['name']!,
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