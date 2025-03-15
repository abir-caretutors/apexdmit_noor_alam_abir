

import 'package:apexdmit_noor_alam_abir/data/remote/api_methods.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void setup() {
  if (!sl.isRegistered<ApiService>()) {
    sl.registerLazySingleton<ApiService>(() => ApiService());
  }
}