// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      home_store: (json['home_store'] as List<dynamic>)
          .map((e) => HomeStore.fromJson(e as Map<String, dynamic>))
          .toList(),
      best_seller: (json['best_seller'] as List<dynamic>)
          .map((e) => BestSellers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'home_store': instance.home_store.map((e) => e.toJson()).toList(),
      'best_seller': instance.best_seller.map((e) => e.toJson()).toList(),
    };
