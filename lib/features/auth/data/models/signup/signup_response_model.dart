import 'package:cubitoket/features/auth/domain/entities/api_status_entities.dart';

class SignUpResponseModel extends ApiStatusEntity {
  const SignUpResponseModel({required bool status}) : super(status: status);

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(status: json['status']);
}
