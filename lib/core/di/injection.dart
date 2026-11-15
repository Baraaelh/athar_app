import 'package:get_it/get_it.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/register_donor_usecase.dart';
import '../../features/auth/presentation/cubit/register_cubit.dart';
import '../../features/home/data/datasources/home_local_data_source.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/get_categories_usecase.dart';
import '../../features/home/domain/usecases/get_sponsorships_usecase.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/main_shell/presentation/cubit/main_shell_cubit.dart';

/// Service locator.
final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  // ---------- Auth ----------
  sl
    ..registerLazySingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl.new)
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()))
    ..registerLazySingleton(() => RegisterDonorUseCase(sl()))
    ..registerFactory(() => RegisterCubit(sl()));

  // ---------- Home ----------
  sl
    ..registerLazySingleton<HomeLocalDataSource>(HomeLocalDataSourceImpl.new)
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()))
    ..registerLazySingleton(() => GetCategoriesUseCase(sl()))
    ..registerLazySingleton(() => GetSponsorshipsUseCase(sl()))
    ..registerFactory(() => HomeCubit(getCategories: sl(), getSponsorships: sl()));

  // ---------- Shell ----------
  sl.registerFactory(MainShellCubit.new);
}
