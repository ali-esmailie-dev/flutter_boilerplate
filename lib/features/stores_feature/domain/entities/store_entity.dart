import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/features/stores_feature/data/models/store_category_model.dart';
import 'package:flutter_boilerplate/features/stores_feature/data/models/store_model.dart';

class StoreEntity extends Equatable {

  const StoreEntity({
    this.id,
    this.category,
    this.psps,
    this.name,
    this.description,
    this.address,
    this.firstName,
    this.lastName,
    this.geoPoint,
    this.rewardPercent,
    this.totalPercent,
    this.instagramUrl,
    this.openHour,
    this.closeHour,
    this.status,
    this.credit,
    this.averageRate,
    this.countComment,
    this.type,
    this.url,
    this.icon,
    this.shopName,
    this.phone,
    this.mobile,
    this.postalCode,
    this.userSuggested,
    this.isFavorite,
  });
  final int? id;
  final StoreCategoryModel? category;
  final List<PspModel>? psps;
  final String? name;
  final String? description;
  final String? address;
  final String? firstName;
  final String? lastName;
  final String? geoPoint;
  final double? rewardPercent;
  final double? totalPercent;
  final String? instagramUrl;
  final int? openHour;
  final int? closeHour;
  final int? status;
  final bool? credit;
  final double? averageRate;
  final int? countComment;
  final int? type;
  final String? url;
  final String? icon;
  final String? shopName;
  final String? phone;
  final String? mobile;
  final String? postalCode;
  final int? userSuggested;
  final bool? isFavorite;

  @override
  List<Object?> get props => [];
}
