import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ocr_ovd_mobile/src/feature/news/data/repositoryImp/news_repository_impl.dart';
import 'package:ocr_ovd_mobile/src/feature/news/domain/repository/news_repository.dart';
import 'package:ocr_ovd_mobile/src/feature/news/presentation/bloc/news_bloc.dart';
import 'package:ocr_ovd_mobile/src/network/environment.dart';
import 'package:ocr_ovd_mobile/src/network/flavor.dart';
import 'package:ocr_ovd_mobile/src/network/http_client.dart';
import 'package:ocr_ovd_mobile/src/network/rest_client.dart';
import 'package:ocr_ovd_mobile/src/router/app_route.dart';

final getIt = GetIt.instance;

/*@InjectableInit(
    initializerName: "init",
    preferRelativeImports: true,
    asExtension: true,
    usesNullSafety: true)*/
Future<void> configureDependencies() async {
  getIt.registerSingletonAsync<Environment>(() async {
    final environment = await Flavor.getFlavor("uat");
    return environment;
  });
 // getIt.registerSingleton<Dio>(Dio());

  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  // getIt.registerLazySingleton<Environment>(() => Environment();
  getIt.registerSingletonAsync<RestClient>(() async {
    final dio = DataClient.getDioClient(getIt());
    return RestClient(dio!);
  }, dependsOn: [Environment]);

  getIt.registerSingletonWithDependencies<NewsRepository>(
      () => NewsRepositoryImpl(getIt()),
      dependsOn: [RestClient]);

  getIt.registerFactory<NewsBloc>(
          ()=> NewsBloc(getIt())
  );
}
