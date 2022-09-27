// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_sellers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestSellers _$BestSellersFromJson(Map<String, dynamic> json) => BestSellers(
      id: json['id'] as int,
      is_favorites: json['is_favorites'] as bool,
      title: json['title'] as String,
      price_without_discount: json['price_without_discount'] as int,
      discount_price: json['discount_price'] as int,
      picture: json['picture'] as String,
    );

Map<String, dynamic> _$BestSellersToJson(BestSellers instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_favorites': instance.is_favorites,
      'title': instance.title,
      'price_without_discount': instance.price_without_discount,
      'discount_price': instance.discount_price,
      'picture': instance.picture,
    };
