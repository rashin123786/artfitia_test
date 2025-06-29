import 'package:artifitia_test/features/home/domain/entity/banner_entity.dart';
import 'package:artifitia_test/features/home/domain/entity/items_entity.dart';

import '../entity/category_entity.dart';

abstract class HomeDomainRepo {
  Future<List<CategoryEntity>> getCategories();
  Future<List<BannerEntity>> getBanner();
  Future<List<ItemsEntity>> getItems();
}
