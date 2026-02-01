import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:social_mate_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:social_mate_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:social_mate_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:social_mate_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:social_mate_app/features/auth/domain/usecases/sign_up_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUsecase signInUsecase;
  final SignUpUsecase signUpUsecase;
  final SignOutUsecase signOutUsecase;

  AuthBloc(this.signInUsecase, this.signUpUsecase, this.signOutUsecase)
    : super(AuthInitial()) {
    on<SignInEvent>(_onSignIn);
    on<SignUpEvent>(_onSignUp);
    on<SignOutEvent>(_onSignOut);
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
