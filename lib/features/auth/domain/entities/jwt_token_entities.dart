import 'package:cubitoket/features/auth/domain/entities/api_status_entities.dart';
import 'package:equatable/equatable.dart';

class JwtTokenEntity extends Equatable {
  final String jwt;
  final ApiStatusEntity status;

  const JwtTokenEntity({required this.jwt, required this.status});

  @override
  List<Object?> get props => [];
}
