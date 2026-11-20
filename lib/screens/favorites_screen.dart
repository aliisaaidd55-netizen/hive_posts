import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/post_model.dart';
import '../services/favorites_service.dart';


class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});
  final FavoritesService _favoritesService = FavoritesService();

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Post>('favoritesBox');
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: ValueListenableBuilder<Box<Post>>(
        valueListenable: box.listenable(),
        builder: (context, box, _) {
          final favorites = _favoritesService.getFavorites();
          if (favorites.isEmpty) {
            return const Center(child: Text('No favorites yet', style: TextStyle(fontSize: 18)));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final post = favorites[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: CircleAvatar(child: Text(post.id.toString())),
                  title: Text(post.title, maxLines: 1, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(post.body, maxLines: 2),
                  trailing: IconButton(
                    icon: const Icon(Icons.star, color: Colors.amber),
                    onPressed: () => _favoritesService.toggleFavorite(post),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
