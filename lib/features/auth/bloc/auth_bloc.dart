import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:social_mate_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:social_mate_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:social_mate_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:social_mate_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUsecase signInUsecase;
  final SignUpUsecase signUpUsecase;
  final SignOutUsecase signOutUsecase;

  AuthBloc(this.signInUsecase, this.signUpUsecase, this.signOutUsecase)
    : super(AuthInitial()) {
    on<SignInEvent>(_onSignIn, transformer: droppable());
    on<SignUpEvent>(_onSignUp, transformer: droppable());
    on<SignOutEvent>(_onSignOut, transformer: droppable());
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await signInUsecase(event.params);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await signUpUsecase(event.params);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await signOutUsecase();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
