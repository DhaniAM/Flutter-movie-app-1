import 'package:ditonton/data/models/trailer_model.dart';
import 'package:equatable/equatable.dart';

class TrailerResponse extends Equatable {
  final List<TrailerModel> listTrailerModel;

  TrailerResponse({required this.listTrailerModel});

  factory TrailerResponse.fromJson(Map<String, dynamic> json) =>
      TrailerResponse(
        listTrailerModel: List<TrailerModel>.from(
            (json['results'] as List).map((x) => TrailerModel.fromJson(x))),
      );

  @override
  List<Object> get props => [listTrailerModel];
}
