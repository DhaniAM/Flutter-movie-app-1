import 'package:ditonton/domain/entities/trailer.dart';
import 'package:equatable/equatable.dart';

class TrailerModel extends Equatable {
  final String keyName;

  TrailerModel({required this.keyName});

  factory TrailerModel.fromJson(Map<String, dynamic> json) =>
      TrailerModel(keyName: json['key']);

  Trailer toEntity() => Trailer(keyName: keyName);

  @override
  List<Object> get props => [keyName];
}
