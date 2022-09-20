part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final JwtTokenEntity jwtTokenEntity;

  const LoginLoaded({required this.jwtTokenEntity});

  @override
  List<Object> get props => [jwtTokenEntity.jwt];
}

class LoginError extends LoginState {
  final String error;

  const LoginError(this.error);

  @override
  List<Object> get props => [error];
}
