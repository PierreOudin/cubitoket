import 'package:cubitoket/core/errors/exceptions.dart';
import 'package:cubitoket/core/errors/failures.dart';
import 'package:cubitoket/features/auth/data/models/login/login_request_model.dart';
import 'package:cubitoket/features/auth/data/models/login/login_response_model.dart';
import 'package:cubitoket/features/auth/data/models/signup/signup_request_model.dart';
import 'package:cubitoket/features/auth/data/models/signup/signup_response_model.dart';
import 'package:cubitoket/features/auth/domain/entities/api_status_entities.dart';
import 'package:cubitoket/features/auth/domain/entities/jwt_token_entities.dart';
import 'package:cubitoket/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  var dio = Dio();
  final String _baseUri = "localhost:80";

  @override
  Future<Either<Failure, JwtTokenEntity>> getToken(
      String email, String password) async {
    try {
      final response = await dio.post("$_baseUri/login",
          data: LoginRequestModel(email: email, password: password).toJson());
      return Right(
          LoginResponseModel.fromJson(response as Map<String, dynamic>));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ApiStatusEntity>> addUser(String firstname,
      String lastname, String email, String phone, String password) async {
    try {
      final response = await dio.post("$_baseUri/signup",
          data: SignUpRequestModel(
                  firstname: firstname,
                  lastname: lastname,
                  email: email,
                  phone: phone,
                  password: password)
              .toJson());
      return Right(
          SignUpResponseModel.fromJson(response as Map<String, dynamic>));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
