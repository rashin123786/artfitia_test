import 'package:artifitia_test/features/home/data/model/banner_model.dart';
import 'package:artifitia_test/features/home/data/model/items_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/banner_entity.dart';
import '../model/category_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<BannerEntity>> getBanner();
  Future<List<ItemsModel>> getItems();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  HomeRemoteDataSourceImpl();

  @override
  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await firestore.collection('category').get();
    return snapshot.docs
        .map((doc) => CategoryModel.fromMap(doc.data()))
        .toList();
  }

  @override
  Future<List<BannerEntity>> getBanner() async {
    final snapshot = await firestore.collection('banner').get();
    return snapshot.docs.map((doc) => BannerModel.fromMap(doc.data())).toList();
  }

  @override
  Future<List<ItemsModel>> getItems() async {
    final snapshot = await firestore.collection('items').get();
    return snapshot.docs.map((doc) => ItemsModel.fromMap(doc.data())).toList();
  }
}
