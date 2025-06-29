part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class FetchHomeCategoryEvent extends HomeEvent {}

final class FetchHomeBannerEvent extends HomeEvent {}
