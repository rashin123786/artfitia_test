import 'package:artifitia_test/features/home/domain/entity/items_entity.dart';

class ItemsModel extends ItemsEntity {
  ItemsModel(
      {required super.amount, required super.name, required super.imageUrl});
  factory ItemsModel.fromMap(Map<String, dynamic> map) {
    return ItemsModel(
      name: map['name'] ?? '',
      imageUrl: map['image'] ?? '',
      amount: map['amount'] ?? '',
    );
  }
}
