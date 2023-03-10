import 'package:flutter/foundation.dart';
import 'package:movie_pro/common/state_enum.dart';
import 'package:movie_pro/domain/entities/movie.dart';
import 'package:movie_pro/domain/usecases/get_now_playing_movies.dart';

class NowPlayingMoviesNotifier extends ChangeNotifier {
  final GetNowPlayingMovies getNowPlayingMovies;

  NowPlayingMoviesNotifier(this.getNowPlayingMovies);

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  List<Movie> _movie = [];
  List<Movie> get movies => _movie;

  String _message = '';
  String get message => _message;

  Future<void> fetchNowPlayingMovies() async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await getNowPlayingMovies.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.error;
        notifyListeners();
      },
      (tvSeries) {
        _movie = tvSeries;
        _state = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
