import 'package:artifitia_test/features/home/domain/usecase/home_usecases.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/banner_entity.dart';
import '../../../domain/entity/category_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUsecases homeUsecases;
  List<BannerEntity> banners = [];
  HomeBloc(this.homeUsecases) : super(HomeInitial()) {
    on<FetchHomeCategoryEvent>(_fetchHomeCategory);
    on<FetchHomeBannerEvent>(_fetchHomeBanner);
  }

  Future _fetchHomeCategory(
      FetchHomeCategoryEvent event, Emitter<HomeState> emit) async {
    emit(HomeCategoryLoadingState());
    final data = await homeUsecases.getCategoryData();
    if (data.isNotEmpty) {
      emit(HomeCategorySuccessState(data: data));
    } else {
      emit(HomeCategoryEmptyState());
    }
  }

  Future _fetchHomeBanner(
      FetchHomeBannerEvent event, Emitter<HomeState> emit) async {
    emit(HomeBannerLoadingState());
    final data = await homeUsecases.getBanner();
    if (data.isNotEmpty) {
      emit(HomeBannerSuccessState(data: data));
    } else {
      emit(HomeBannerEmptyState());
    }
  }
}
