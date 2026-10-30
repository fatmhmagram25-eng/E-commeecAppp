
import 'package:e_commerce_app/core/animated_snack/storeh_helper.dart';
import 'package:e_commerce_app/core/networking/dio_helper.dart';
import 'package:e_commerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/repo/auth_ripo.dart';

import 'package:e_commerce_app/features/home_screen/cubit/catrgoris_cubit.dart';
import 'package:e_commerce_app/features/home_screen/cubit/proect_cubit.dart';
import 'package:e_commerce_app/features/home_screen/repo/home_repo.dart';
import 'package:get_it/get_it.dart';

GetIt sl=GetIt.instance;
void  setupServiceLocator() {
DioHelper Dio =DioHelper();
sl.registerSingleton<DioHelper>(Dio);
// storegHelper
sl.registerLazySingleton(() =>StorgeHelper());

sl.registerLazySingleton( () =>AuthRepo(sl<DioHelper>()));
sl.registerLazySingleton( () => Homerepo(sl<DioHelper>()));



sl.registerFactory( () => AuthCubit(sl()));

sl.registerFactory( () => ProdectCubit(sl<Homerepo>()));
sl.registerFactory( () => CategorisCubit(sl<Homerepo>()));

  // Register your services here
  // Example: sl.registerSingleton<YourService>(YourServiceImplementation());
}
