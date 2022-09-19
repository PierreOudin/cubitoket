import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_status_entities.freezed.dart';

@freezed
class ApiStatusEntities with _$ApiStatusEntities {
  const factory ApiStatusEntities({required bool status}) = _ApiStatusEntities;
}
