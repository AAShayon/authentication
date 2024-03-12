
import 'package:dio/dio.dart';
import 'package:excel_hrm/features/authentication/data/datasource/remote/dio/dio_client.dart';
import 'package:excel_hrm/features/authentication/data/datasource/remote/dio/logging_interceptor.dart';
import 'package:excel_hrm/features/authentication/provider/auth_provider.dart';
import 'package:excel_hrm/utils/constants/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/authentication/data/repository/auth_repo.dart';

final sl=GetIt.instance;
Future<void> init() async{
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL,sl() ,loggingInterceptor: sl(),sharedPreferences: sl() ));

  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
 sl.registerFactory(() => AuthProvider(authRepo:sl()));








  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());



}