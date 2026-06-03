import 'package:flutter/material.dart';
import 'package:simple_navigation_mock/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  final List<bool> favorites = [false, false, false];

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

              trailing: IconButton(
                icon: Icon(
                  favorites[index]
                      ? Icons.star
                      : Icons.star_border,
                ),
                onPressed: () {
                  setState(() {
                    favorites[index] = !favorites[index];
                  });
                },
              ),

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