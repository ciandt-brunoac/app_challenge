import 'package:app_challenge/common/core/common_inject.dart';
import 'package:app_challenge/core/config/graphql_service.dart';
import 'package:app_challenge/core/inject/app_inject_config.dart';
import 'package:app_challenge/features/home/core/home_inject.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

class AppInject extends AppInjectConfig {
  final List<AppInjectConfig> _modules = [
    CommonInject(),
    HomeInject(),
  ];

  AppInject._() {
    datasources();
    repositories();
    usecases();
    cubits();
  }

  static Future<void> start() async {
    AppInject._();
    await _registerServices();
  }

  @override
  void datasources() {
    for (final module in _modules) {
      module.datasources();
    }
    print("Datasources registered");
  }

  @override
  void repositories() {
    for (final module in _modules) {
      module.repositories();
    }
    print("Repositories registered");
  }

  @override
  void usecases() {
    for (final module in _modules) {
      module.usecases();
    }
    print("Usecases registered");
  }

  @override
  void cubits() {
    for (final module in _modules) {
      module.cubits();
    }
    print("Cubits registered");
  }

  static Future<void> _registerServices() async {
    getIt.registerSingletonAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());
    await getIt.allReady();

    getIt.registerLazySingleton<GraphQlService>(() => GraphQlService());

    print("Services registered");
  }
}
