import 'package:artifitia_test/features/home/domain/entity/banner_entity.dart';
import 'package:artifitia_test/features/home/domain/entity/items_entity.dart';
import 'package:artifitia_test/features/home/domain/repo/home_domain_repo.dart';

import '../entity/category_entity.dart';

class HomeUsecases {
  final HomeDomainRepo repository;

  HomeUsecases(this.repository);

  Future<List<CategoryEntity>> getCategoryData() async {
    return await repository.getCategories();
  }

  Future<List<BannerEntity>> getBanner() async {
    return await repository.getBanner();
  }

  Future<List<ItemsEntity>> getItems() async {
    return await repository.getItems();
  }
}
