import 'package:flutter/material.dart';
import 'package:pert8/providers/favorite_providers.dart';
import 'package:pert8/pages/favorite_page.dart';
import 'package:provider/provider.dart';

class FavoriteComponent extends StatelessWidget {
  const FavoriteComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = context.watch<FavoriteProvider>();
    final count = favoriteProvider.favorites.length;
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FavoritePage()),
            );
          },
          icon: const Icon(Icons.favorite),
        ),
        if (count > 0)
        Positioned(
          right: 6,
          top: 6,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.deepOrange,
            child: Text(
              '$count',
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}