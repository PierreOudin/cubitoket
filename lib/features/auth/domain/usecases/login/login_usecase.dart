import 'package:cubitoket/core/errors/failures.dart';
import 'package:cubitoket/features/auth/domain/entities/jwt_token_entities.dart';
import 'package:cubitoket/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, JwtTokenEntity>> call(
      String email, String password) async {
    print("LoginUseCase");
    return repository.getToken(email, password);
  }
}
