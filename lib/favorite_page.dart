import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final List<String> favorites;

  const FavoritePage({
    super.key,
    required this.favorites,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('お気に入り一覧'),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text('お気に入りはありません'),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favorites[index]),
                );
              },
            ),
    );
  }
}