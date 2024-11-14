// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sisyphus/injection/module/service_module.dart' as _i292;
import 'package:sisyphus/src/repositories/repository.dart' as _i168;
import 'package:sisyphus/src/services/network_service.dart' as _i1071;
import 'package:sisyphus/src/services/ui_service.dart' as _i804;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final serviceModule = _$ServiceModule();
    gh.singleton<_i361.Dio>(() => serviceModule.dioClient);
    gh.singleton<_i804.UIService>(() => _i804.UIService());
    gh.singleton<_i1071.NetworkService>(() => _i1071.DioClient(
          gh<_i804.UIService>(),
          gh<_i361.Dio>(),
        ));
    gh.singleton<_i168.Repo>(
        () => _i168.RepoImpl(request: gh<_i1071.NetworkService>()));
    return this;
  }
}

class _$ServiceModule extends _i292.ServiceModule {}
