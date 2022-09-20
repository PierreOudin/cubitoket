import 'package:cubitoket/features/auth/domain/entities/api_status_entities.dart';
import 'package:cubitoket/features/auth/domain/entities/jwt_token_entities.dart';

class LoginResponseModel extends JwtTokenEntity {
  LoginResponseModel({required String jwt, required bool status})
      : super(jwt: jwt, status: ApiStatusEntity(status: status));

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(jwt: json['jwt'], status: json['status']);
}
