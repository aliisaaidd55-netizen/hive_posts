import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/post_model.dart';
import '../services/post_service.dart';
import '../services/favorites_service.dart';
import 'favorites_screen.dart';


class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});
  @override
  State<PostsScreen> createState() => _PostsScreenState();
}


class _PostsScreenState extends State<PostsScreen> {
  final PostService _service = PostService();
  final FavoritesService _favoritesService = FavoritesService();
  late Future<List<Post>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = _service.getPosts();
  }


  Future<void> _refresh() async {
    setState(() => _postsFuture = _service.getPosts());
    await _postsFuture;
  }


  @override
  Widget build(BuildContext context) {
    final favoritesBox = Hive.box<Post>('favoritesBox');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            tooltip: 'Favorites',
            icon: const Icon(Icons.favorite),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FavoritesScreen())),
          ),
        ],
      ),
      body: FutureBuilder<List<Post>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final posts = snapshot.data ?? [];
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ValueListenableBuilder<Box<Post>>(
              valueListenable: favoritesBox.listenable(),
              builder: (context, box, _) => ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  final favorite = _favoritesService.isFavorite(post.id);
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: CircleAvatar(child: Text(post.id.toString())),
                      title: Text(post.title, maxLines: 1, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(post.body, maxLines: 2),
                      trailing: IconButton(
                        icon: Icon(favorite ? Icons.star : Icons.star_border, color: favorite ? Colors.amber : null),
                        onPressed: () => _favoritesService.toggleFavorite(post),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
