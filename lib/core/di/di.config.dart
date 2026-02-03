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
import 'package:social_mate_app/core/services/auth_listener.dart' as _i859;
import 'package:social_mate_app/core/services/toast_service.dart' as _i169;
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
import 'package:social_mate_app/features/create_story/data/local/gallery_local_datasource.dart'
    as _i164;
import 'package:social_mate_app/features/create_story/data/local/gallery_local_datasource_impl.dart'
    as _i860;
import 'package:social_mate_app/features/create_story/data/repos/gallery_repo_impl.dart'
    as _i925;
import 'package:social_mate_app/features/create_story/domain/repos/gallery_repo.dart'
    as _i579;
import 'package:social_mate_app/features/create_story/domain/usecases/get_photos_usecase.dart'
    as _i540;
import 'package:social_mate_app/features/create_story/presentation/bloc/gallery_bloc.dart'
    as _i853;
import 'package:social_mate_app/features/create_story/presentation/cubit/story_bg_controller_cubit.dart'
    as _i698;
import 'package:social_mate_app/features/home/data/remote/story_remote_datasource.dart'
    as _i915;
import 'package:social_mate_app/features/home/data/remote/story_remote_datasource_impl.dart'
    as _i24;
import 'package:social_mate_app/features/home/data/repos/story_repo_impl.dart'
    as _i444;
import 'package:social_mate_app/features/home/domain/repos/story_repo.dart'
    as _i590;
import 'package:social_mate_app/features/home/domain/usecases/get_stories_usecase.dart'
    as _i580;
import 'package:social_mate_app/features/home/presentation/bloc/story_bloc.dart'
    as _i200;
import 'package:social_mate_app/global/bloc/app_flow_bloc.dart' as _i845;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i698.StoryBgControllerCubit>(
      () => _i698.StoryBgControllerCubit(),
    );
    gh.lazySingleton<_i454.SupabaseClient>(() => registerModule.supabaseClient);
    gh.lazySingleton<_i169.ToastService>(() => _i169.ToastService());
    gh.lazySingleton<_i164.GalleryLocalDataSource>(
      () => _i860.GalleryLocalDatasourceImpl(),
    );
    gh.lazySingleton<_i579.GalleryRepo>(
      () => _i925.GalleryRepoImpl(
        galleryLocalDataSource: gh<_i164.GalleryLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i915.StoryRemoteDataSource>(
      () => _i24.StoryRemoteDatasourceImpl(
        supabaseClient: gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i250.AuthRemoteDataSource>(
      () => _i633.AuthRemoteDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i540.GetPhotosUsecase>(
      () => _i540.GetPhotosUsecase(galleryRepo: gh<_i579.GalleryRepo>()),
    );
    gh.lazySingleton<_i859.AuthListener>(
      () => _i859.AuthListener(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i845.AppFlowBloc>(
      () => _i845.AppFlowBloc(gh<_i859.AuthListener>()),
    );
    gh.lazySingleton<_i590.StoryRepo>(
      () => _i444.StoryRepoImpl(
        storyRemoteDataSource: gh<_i915.StoryRemoteDataSource>(),
      ),
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
    gh.factory<_i853.GalleryBloc>(
      () => _i853.GalleryBloc(getPhotosUsecase: gh<_i540.GetPhotosUsecase>()),
    );
    gh.factory<_i944.AuthBloc>(
      () => _i944.AuthBloc(
        gh<_i525.SignInUsecase>(),
        gh<_i424.SignUpUsecase>(),
        gh<_i691.SignOutUsecase>(),
      ),
    );
    gh.lazySingleton<_i580.GetStoriesUseCase>(
      () => _i580.GetStoriesUseCase(gh<_i590.StoryRepo>()),
    );
    gh.factory<_i200.StoryBloc>(
      () => _i200.StoryBloc(getStoriesUseCase: gh<_i580.GetStoriesUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i124.RegisterModule {}
