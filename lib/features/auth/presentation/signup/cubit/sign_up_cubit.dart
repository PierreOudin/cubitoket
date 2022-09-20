import 'package:cubitoket/features/auth/domain/entities/api_status_entities.dart';
import 'package:cubitoket/features/auth/domain/usecases/signup/sign_up_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpCubit(this.signUpUseCase) : super(SignUpInitial());

  void addUser(String firstname, String lastname, String email, String phone,
      String password) async {
    emit(SignUpLoading());
    final failureOrSuccess =
        await signUpUseCase(firstname, lastname, email, phone, password);
    emit(failureOrSuccess.fold((failure) => SignUpError(failure.toString()),
        (apiStatusEntity) => SignUpLoaded(apiStatusEntity: apiStatusEntity)));
  }
}
