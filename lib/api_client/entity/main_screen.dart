import 'package:ecommerce_app/api_client/entity/best_sellers.dart';
import 'package:ecommerce_app/api_client/entity/home_store.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_screen.g.dart';

@JsonSerializable(explicitToJson: true)
class Post {
  List<HomeStore> home_store;
  List<BestSellers> best_seller;
  Post({
    required this.home_store,
    required this.best_seller,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
