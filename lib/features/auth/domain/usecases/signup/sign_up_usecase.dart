import 'dart:math';

import 'package:cubitoket/core/errors/failures.dart';
import 'package:cubitoket/features/auth/domain/entities/api_status_entities.dart';
import 'package:cubitoket/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<Failure, ApiStatusEntity>> call(String firstname,
      String lastname, String email, String phone, String password) async {
    return await repository.addUser(
        firstname, lastname, email, phone, password);
  }
}
