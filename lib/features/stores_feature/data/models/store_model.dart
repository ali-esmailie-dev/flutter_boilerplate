import 'package:flutter_boilerplate/features/stores_feature/data/models/store_category_model.dart';
import 'package:flutter_boilerplate/features/stores_feature/domain/entities/store_entity.dart';

List<StoreModel> storeModelListFromJson(
  final data, {
  final List<StoreModel>? storeFavorites,
}) {
  return data.map<StoreModel>((final x) {
    bool isFavorite = false;
    if (storeFavorites != null) {
      for (final StoreModel element in storeFavorites) {
        if (x['id'] == element.id) {
          isFavorite = true;
        }
      }
    }
    return StoreModel.fromJson(x, isFavorite);
  }).toList();
}

class StoreModel extends StoreEntity {
  const StoreModel({
    super.id,
    super.category,
    super.psps,
    super.name,
    super.description,
    super.address,
    super.firstName,
    super.lastName,
    super.geoPoint,
    super.rewardPercent,
    super.totalPercent,
    super.instagramUrl,
    super.openHour,
    super.closeHour,
    super.status,
    super.credit,
    super.averageRate,
    super.countComment,
    super.type,
    super.url,
    super.icon,
    super.shopName,
    super.phone,
    super.mobile,
    super.postalCode,
    super.userSuggested,
    super.isFavorite,
  });

  factory StoreModel.fromJson(
    final Map<String, dynamic> json,
    final bool isFavorite,
  ) =>
      StoreModel(
        id: json['id'],
        category: json['category'] != null
            ? StoreCategoryModel.fromJson(json['category'])
            : null,
        psps: json['store_pos'] != null
            ? List<PspModel>.from(
                json['store_pos'].map(
                  (final x) => PspModel.fromJson(x),
                ),
              )
            : [],
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        address: json['address'] ?? '',
        firstName: json['first_name'] ?? '',
        lastName: json['last_name'] ?? '',
        geoPoint: json['geo_point'] ?? '',
        rewardPercent: json['reward_percent'],
        totalPercent: json['total_percent'] ?? 0.0,
        instagramUrl: json['instagram_url'] ?? '',
        openHour: json['open_hour'] ?? 0,
        closeHour: json['close_hour'] ?? 0,
        credit: json['credit'] ?? false,
        averageRate: json['average_rate'],
        countComment: json['count_comment'] ?? 0,
        type: json['type'] ?? 0,
        url: json['url'] ?? '',
        icon: json['v3_icon'] ?? '',
        userSuggested: json['user_suggested'] ?? 0,
        isFavorite: isFavorite,
        status: json['status'],
      );

  factory StoreModel.forFavoriteFromJson(final Map<String, dynamic> json) =>
      StoreModel(
        id: json['id'],
        name: json['name'] ?? '',
        type: json['type'] ?? 0,
        psps: json['json_data'].containsKey('store_psp')
            ? List<PspModel>.from(
                json['json_data']['store_psp'].map(
                  (final x) => PspModel.fromJson(x),
                ),
              )
            : [PspModel(id: 0, name: '', icon: '')],
        openHour: json['open_hour'] ?? 0,
        closeHour: json['close_hour'] ?? 0,
        address: json['address'] ?? '',
        geoPoint: json['geo_point'] ?? '',
        rewardPercent: json['reward_percent'] ?? 0.0,
        credit: json['credit'] ?? false,
        category: json['json_data'].containsKey('category')
            ? json['json_data']['category'] == null
                ? null
                : StoreCategoryModel.fromJson(json['json_data']['category'])
            : null,
        status: json['status'],
      );

  factory StoreModel.forTransactionFromJson(final Map<String, dynamic> json) =>
      StoreModel(
        id: json['id'],
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        address: json['address'] ?? '',
        geoPoint: json['geo_point'] ?? '',
        rewardPercent: json['reward_percent'] ?? 0.0,
        category: json['json_data'].containsKey('category')
            ? StoreCategoryModel.fromJson(json['json_data']['category'])
            : null,
        status: json['status'],
      );
}

class PspModel {
  PspModel({
    this.id,
    this.name,
    this.icon,
  });

  factory PspModel.fromJson(final Map<String, dynamic> json) => PspModel(
        id: json['id'],
        name: json['name'] ?? '',
        icon: json['icon'] ?? '',
      );

  int? id;
  String? name;
  String? icon;
}
