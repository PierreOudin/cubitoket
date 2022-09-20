import 'package:cubitoket/core/errors/failures.dart';
import 'package:cubitoket/features/auth/domain/entities/api_status_entities.dart';
import 'package:cubitoket/features/auth/domain/entities/jwt_token_entities.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, JwtTokenEntity>> getToken(
      final String email, final String password);

  Future<Either<Failure, ApiStatusEntity>> addUser(
      final String firstname,
      final String lastname,
      final String email,
      final String phone,
      final String password);
}
