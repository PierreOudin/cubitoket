import 'package:equatable/equatable.dart';

class ApiStatusEntity extends Equatable {
  final bool status;

  const ApiStatusEntity({required this.status});

  @override
  List<Object?> get props => [];
}
