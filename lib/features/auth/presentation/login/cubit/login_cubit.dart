import 'package:cubitoket/features/auth/domain/usecases/login/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubitoket/features/auth/domain/entities/jwt_token_entities.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  void getToken(String email, String password) async {
    print("LoginCubit.getToken $email $password");
    emit(LoginLoading());
    final failureOrSuccess = await loginUseCase(email, password);
    emit(failureOrSuccess.fold((failure) => LoginError(failure.toString()),
        (jwtTokenEntity) => LoginLoaded(jwtTokenEntity: jwtTokenEntity)));
  }
}
