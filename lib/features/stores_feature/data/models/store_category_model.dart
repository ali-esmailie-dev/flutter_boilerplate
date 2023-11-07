List<StoreCategoryModel>? storeCategoryModelFromJson(final data) => data
    .map<StoreCategoryModel>((final x) => StoreCategoryModel.fromJson(x))
    .toList();

class StoreCategoryModel {
  StoreCategoryModel({
    this.id,
    this.name,
    this.v3Icon,
    this.v3PinIcon,
    this.pwaPin,
    this.pinIcon,
  });

  factory StoreCategoryModel.fromJson(final Map<String, dynamic> json) =>
      StoreCategoryModel(
        id: json['id'],
        name: json['name'] ?? '',
        v3Icon: json['v3_icon'] ?? '',
        v3PinIcon: json['v3_pin'] ?? '',
        pwaPin: json['pwa_pin'] ?? '',
        pinIcon: json['pin_icon'] ?? '',
      );

  int? id;
  String? name;
  String? v3Icon;
  String? v3PinIcon;
  String? pwaPin;
  String? pinIcon;
}
