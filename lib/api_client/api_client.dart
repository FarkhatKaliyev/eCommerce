import 'dart:io';
import 'dart:convert';
import 'package:ecommerce_app/api_client/entity/main_screen.dart';
import 'package:ecommerce_app/api_client/entity/product.dart';

class ApiClient {
  final client = HttpClient();

  Future<dynamic> get(String ulr) async {
    final url = Uri.parse(ulr);
    final request = await client.getUrl(url);
    final response = await request.close();

    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final dynamic json = jsonDecode(jsonString) as Map<String, dynamic>;
    return json;
  }

  Future<Post> getPosts() async {
    final json = await get(
        'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');
    final posts = Post.fromJson(json);
    return posts;
  }

  Future<Product> getProductPosts() async {
    final json = await get(
        'https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5');
    final posts = Product.fromJson(json);
    return posts;
  }
}
