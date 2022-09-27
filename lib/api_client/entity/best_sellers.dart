// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'best_sellers.g.dart';

@JsonSerializable()
class BestSellers {
  final int id;
  final bool is_favorites;
  final String title;
  final int price_without_discount;
  final int discount_price;
  final String picture;

  BestSellers({
    required this.id,
    required this.is_favorites,
    required this.title,
    required this.price_without_discount,
    required this.discount_price,
    required this.picture,
  });

  factory BestSellers.fromJson(Map<String, dynamic> json) =>
      _$BestSellersFromJson(json);
  Map<String, dynamic> toJson() => _$BestSellersToJson(this);
}
