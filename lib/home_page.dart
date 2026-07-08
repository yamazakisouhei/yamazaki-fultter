import 'package:flutter/material.dart';
import 'package:simple_navigation_mock/detail_page.dart';
import 'package:simple_navigation_mock/favorite_page.dart';

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

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredSpots = touristSpots.where((spot) {
      return spot['name']!
          .toLowerCase()
          .contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fukushima Navi'),
        actions: [
          IconButton(
            icon: Badge(
  label: Text(
    favorites.where((f) => f).length.toString(),
  ),
  child: const Icon(Icons.star),
),
            onPressed: () {
              List<String> favoriteSpots = [];

              for (int i = 0; i < touristSpots.length; i++) {
                if (favorites[i]) {
                  favoriteSpots.add(
                    touristSpots[i]['name']!,
                  );
                }
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritePage(
                    favorites: favoriteSpots,
                  ),
                ),
              );
            },
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: '観光地を検索',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filteredSpots.length,
              itemBuilder: (context, index) {
                final originalIndex = touristSpots.indexOf(
                  filteredSpots[index],
                );

                return Card(
                  child: ListTile(
                    leading: Image.asset(
                      filteredSpots[index]['image']!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),

                    title: Text(
                      filteredSpots[index]['name']!,
                    ),

                    trailing: IconButton(
                      icon: Icon(
                        favorites[originalIndex]
                            ? Icons.star
                            : Icons.star_border,
                      ),
                      onPressed: () {
                        setState(() {
                          favorites[originalIndex] =
                              !favorites[originalIndex];
                        });
                      },
                    ),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            spotName:
                                filteredSpots[index]['name']!,
                            imagePath:
                                filteredSpots[index]['image']!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}