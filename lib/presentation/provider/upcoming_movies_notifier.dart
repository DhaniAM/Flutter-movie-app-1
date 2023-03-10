import 'package:flutter/foundation.dart';
import 'package:movie_pro/common/state_enum.dart';
import 'package:movie_pro/domain/entities/movie.dart';
import 'package:movie_pro/domain/usecases/get_upcoming_movies.dart';

class UpcomingMoviesNotifier extends ChangeNotifier {
  final GetUpcomingMovies getUpcomingMovies;

  UpcomingMoviesNotifier(this.getUpcomingMovies);

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  String _message = '';
  String get message => _message;

  Future<void> fetchUpcomingMovies() async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await getUpcomingMovies.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.error;
        notifyListeners();
      },
      (moviesData) {
        _movies = moviesData;
        _state = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
