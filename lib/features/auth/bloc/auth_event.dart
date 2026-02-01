part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthEvent {
  final SignInEntity params;
  const SignInEvent(this.params);
  @override
  List<Object> get props => [params];
}

class SignUpEvent extends AuthEvent {
  final SignUpEntity params;
  const SignUpEvent(this.params);
  @override
  List<Object> get props => [params];
}

class SignOutEvent extends AuthEvent {
  const SignOutEvent();
  @override
  List<Object> get props => [];
}
