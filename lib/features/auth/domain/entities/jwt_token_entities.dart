import 'package:cubitoket/features/auth/domain/entities/api_status_entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'jwt_token_entities.freezed.dart';

@freezed
class JwtTokenEntities with _$JwtTokenEntities {
  const factory JwtTokenEntities(
      {required ApiStatusEntities status,
      required String jwt}) = _JwtTokenEntities;
}
