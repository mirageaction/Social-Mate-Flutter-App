// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:social_mate_app/core/di/register_module.dart' as _i124;
import 'package:social_mate_app/features/auth/bloc/auth_bloc.dart' as _i944;
import 'package:social_mate_app/features/auth/data/remote/auth_remote_datasource.dart'
    as _i250;
import 'package:social_mate_app/features/auth/data/remote/auth_remote_datasource_impl.dart'
    as _i633;
import 'package:social_mate_app/features/auth/data/repos/auth_repo_impl.dart'
    as _i375;
import 'package:social_mate_app/features/auth/domain/repos/auth_repo.dart'
    as _i358;
import 'package:social_mate_app/features/auth/domain/usecases/sign_in_usecase.dart'
    as _i525;
import 'package:social_mate_app/features/auth/domain/usecases/sign_out_usecase.dart'
    as _i691;
import 'package:social_mate_app/features/auth/domain/usecases/sign_up_usecase.dart'
    as _i424;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i454.SupabaseClient>(() => registerModule.supabaseClient);
    gh.lazySingleton<_i250.AuthRemoteDataSource>(
      () => _i633.AuthRemoteDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i358.AuthRepo>(
      () => _i375.AuthRepoImpl(gh<_i250.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i525.SignInUsecase>(
      () => _i525.SignInUsecase(gh<_i358.AuthRepo>()),
    );
    gh.lazySingleton<_i691.SignOutUsecase>(
      () => _i691.SignOutUsecase(gh<_i358.AuthRepo>()),
    );
    gh.lazySingleton<_i424.SignUpUsecase>(
      () => _i424.SignUpUsecase(gh<_i358.AuthRepo>()),
    );
    gh.factory<_i944.AuthBloc>(
      () => _i944.AuthBloc(
        gh<_i525.SignInUsecase>(),
        gh<_i424.SignUpUsecase>(),
        gh<_i691.SignOutUsecase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i124.RegisterModule {}
