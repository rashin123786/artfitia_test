import 'package:artifitia_test/features/home/domain/entity/banner_entity.dart';

class BannerModel extends BannerEntity {
  BannerModel({required super.imageUrl});
  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      imageUrl: map['image'] ?? "",
    );
  }
}
