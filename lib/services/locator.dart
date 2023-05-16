import 'package:bloc_rest_api_demo/services/app_display_service.dart';
import 'package:bloc_rest_api_demo/services/navigator_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setUp()
{
  locator.registerLazySingleton<NavigatorService>(() => NavigatorService());
  locator.registerLazySingleton<AppDisplayService>(() => AppDisplayService());
}