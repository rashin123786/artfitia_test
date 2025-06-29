import 'package:artifitia_test/features/auth/data/data_sources/auth_data_source.dart';
import 'package:artifitia_test/features/auth/data/repo/auth_repo.dart';
import 'package:artifitia_test/features/auth/domain/repo/auth_repo.dart';
import 'package:artifitia_test/features/auth/domain/usecases/auth_usecases.dart';
import 'package:artifitia_test/features/checkout/data/datasource/checkout_remote_datasource.dart';
import 'package:artifitia_test/features/checkout/data/repo/checkout_repository_impl.dart';
import 'package:artifitia_test/features/checkout/domain/usecases/checkout_usecase.dart';
import 'package:artifitia_test/features/checkout/presentation/controller/bloc/checkout_bloc.dart';
import 'package:artifitia_test/features/home/data/datasource/home_remote_data_source.dart';
import 'package:artifitia_test/features/home/data/repo/home_repo.dart';
import 'package:artifitia_test/features/home/domain/repo/home_domain_repo.dart';
import 'package:artifitia_test/features/home/domain/usecase/home_usecases.dart';
import 'package:artifitia_test/features/home/presentation/controller/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

import '../features/auth/presentation/controller/bloc/auth_bloc.dart';
import '../features/checkout/domain/repo/checkout_repo.dart';

final getIt = GetIt.I;
Future<void> setupLocator() async {
  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(),
  );
  getIt.registerLazySingleton<AuthDomainRepo>(
    () => AuthRepoImplement(getIt<AuthDataSource>()),
  );
  getIt.registerLazySingleton(
    () => AuthUsecases(getIt()),
  );
  getIt.registerFactory(
    () => AuthBloc(getIt()),
  );
  //====Home =====
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<HomeDomainRepo>(
    () => HomeRepoImpl(getIt<HomeRemoteDataSource>()),
  );
  getIt.registerLazySingleton(
    () => HomeUsecases(getIt()),
  );
  getIt.registerFactory(
    () => HomeBloc(getIt()),
  );
  // == checkout=====
  getIt.registerLazySingleton<CheckoutRemoteDatasource>(
    () => CheckoutRemoteDatasourceImpl(),
  );
  getIt.registerLazySingleton<CheckoutRepo>(
    () => CheckoutRepositoryImpl(getIt<CheckoutRemoteDatasource>()),
  );
  getIt.registerLazySingleton(
    () => CheckoutUsecase(getIt()),
  );
  getIt.registerFactory(
    () => CheckoutBloc(getIt()),
  );
}
