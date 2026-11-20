import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';


class PostService {
  static const String apiUrl = 'https://jsonplaceholder.typicode.com/posts';


  Future<List<Post>> getPosts() async {
    final box = Hive.box<Post>('postsBox');
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final posts = data.map((e) => Post.fromJson(e)).toList();
        await box.clear();
        await box.addAll(posts);
        print('Loaded from API and cached to Hive: ${posts.length}');
        return posts;
      }
      print('API returned status: ${response.statusCode}');
    } catch (e) {
      print('API Failed, reason: $e');
    }
    if (box.isNotEmpty) {
      print('Loaded from Hive offline: ${box.length}');
      return box.values.toList();
    }
    throw Exception('No Internet and No Cached Data');
  }
}
