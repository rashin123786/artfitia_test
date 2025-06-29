part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeCategorySuccessState extends HomeState {
  final List<CategoryEntity> data;

  HomeCategorySuccessState({required this.data});
}

final class HomeCategoryLoadingState extends HomeState {}

final class HomeCategoryEmptyState extends HomeState {}

final class HomeBannerSuccessState extends HomeState {
  final List<BannerEntity> data;

  HomeBannerSuccessState({required this.data});
}

final class HomeBannerLoadingState extends HomeState {}

final class HomeBannerEmptyState extends HomeState {}
