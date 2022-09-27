import 'package:json_annotation/json_annotation.dart';

part 'home_store.g.dart';

@JsonSerializable()
class HomeStore {
  final int id;
  @JsonKey(fromJson: _parseBool)
  late final bool? is_new;
  final String title;
  final String subtitle;
  final String picture;
  final bool is_buy;
  HomeStore({
    required this.id,
    required this.is_new,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.is_buy,
  });
  factory HomeStore.fromJson(Map<String, dynamic> json) =>
      _$HomeStoreFromJson(json);
  Map<String, dynamic> toJson() => _$HomeStoreToJson(this);

  static bool? _parseBool(bool? rawBool) {
    if (rawBool == null) return false;
    return true;
  }
}
