import 'package:cubitoket/features/auth/domain/entities/api_status_entities.dart';
import 'package:cubitoket/features/auth/domain/entities/jwt_token_entities.dart';

class LoginResponseModel extends JwtTokenEntity {
  const LoginResponseModel({required String jwt, required bool status})
      : super(jwt: jwt, status: status as ApiStatusEntity);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(jwt: json['jwt'], status: json['status']);
}
