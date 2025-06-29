import 'package:artifitia_test/features/home/data/datasource/home_remote_data_source.dart';
import 'package:artifitia_test/features/home/domain/entity/banner_entity.dart';
import 'package:artifitia_test/features/home/domain/entity/items_entity.dart';

import '../../domain/entity/category_entity.dart';
import '../../domain/repo/home_domain_repo.dart';

class HomeRepoImpl extends HomeDomainRepo {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepoImpl(this.remoteDataSource);

  @override
  Future<List<CategoryEntity>> getCategories() {
    return remoteDataSource.getCategories();
  }

  @override
  Future<List<BannerEntity>> getBanner() {
    return remoteDataSource.getBanner();
  }

  @override
  Future<List<ItemsEntity>> getItems() {
    return remoteDataSource.getItems();
  }
}
