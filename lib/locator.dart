

import 'package:currencyconverter/feature/conver_currency_feature/data/repositories/convert_repo.dart';
import 'package:get_it/get_it.dart';

import 'core/services/restful_api_client.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(()=> RestfulApiClient());
  locator.registerLazySingleton(()=> ConvertRepo());


}