import 'package:equatable/equatable.dart';

class Trailer extends Equatable {
  final String keyName;

  Trailer({required this.keyName});

  @override
  List<Object?> get props => [keyName];
}
