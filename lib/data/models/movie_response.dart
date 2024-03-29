import 'package:equatable/equatable.dart';
import 'package:movie_pro/data/models/movie_model.dart';

class MovieResponse extends Equatable {
  final List<MovieModel> movieList;

  MovieResponse({required this.movieList});

  /// Convert JSON from API to [MovieResponse] (List of [MovieModel])
  /// to get the list from results in json
  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        movieList: List<MovieModel>.from((json["results"] as List)
            .map((x) => MovieModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(movieList.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [movieList];
}
