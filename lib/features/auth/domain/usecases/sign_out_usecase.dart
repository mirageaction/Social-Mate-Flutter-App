import 'package:injectable/injectable.dart';
import 'package:social_mate_app/core/di/di.dart';
import 'package:social_mate_app/features/auth/domain/repos/auth_repo.dart';
import 'package:social_mate_app/features/home/domain/repos/post_repo.dart';
import 'package:social_mate_app/features/profile/presentation/bloc/profile_bloc.dart';

@LazySingleton()
class SignOutUsecase {
  final AuthRepo repo;
  final PostRepo postRepo;

  SignOutUsecase(this.repo, this.postRepo);

  Future<void> call() async {
    // 1. Sign out from Supabase (Remote)
    await repo.signOut();

    // 2. Clear local caches
    await postRepo.clearCache();

    // 3. Reset session-based singletons
    // if (getIt.isRegistered<ProfileBloc>()) {
    //   getIt.resetLazySingleton<ProfileBloc>();
    // }
  }
}
