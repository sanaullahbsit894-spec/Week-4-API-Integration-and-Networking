import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../models/post_model.dart';

class ApiService {
  static const String _base = 'https://jsonplaceholder.typicode.com';
  static const Duration _timeout = Duration(seconds: 10);

  static Future<List<UserModel>> fetchUsers() async {
    final response = await http
        .get(Uri.parse('$_base/users'))
        .timeout(_timeout);
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => UserModel.fromJson(e)).toList();
    }
    throw Exception('Failed to load users (${response.statusCode})');
  }

  static Future<List<PostModel>> fetchPosts() async {
    final response = await http
        .get(Uri.parse('$_base/posts'))
        .timeout(_timeout);
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => PostModel.fromJson(e)).toList();
    }
    throw Exception('Failed to load posts (${response.statusCode})');
  }

  static Future<UserModel> fetchUserById(int id) async {
    final response = await http
        .get(Uri.parse('$_base/users/$id'))
        .timeout(_timeout);
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load user (${response.statusCode})');
  }

  static Future<List<PostModel>> fetchPostsByUser(int userId) async {
    final response = await http
        .get(Uri.parse('$_base/posts?userId=$userId'))
        .timeout(_timeout);
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => PostModel.fromJson(e)).toList();
    }
    throw Exception('Failed to load user posts (${response.statusCode})');
  }
}
