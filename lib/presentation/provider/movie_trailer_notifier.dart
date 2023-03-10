import 'package:flutter/foundation.dart';
import 'package:movie_pro/common/state_enum.dart';
import 'package:movie_pro/domain/entities/trailer.dart';
import 'package:movie_pro/domain/usecases/get_movie_trailer.dart';

class MovieTrailerNotifier extends ChangeNotifier {
  final GetMovieTrailer getMovieTrailer;

  MovieTrailerNotifier(this.getMovieTrailer);

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  late Trailer _trailer;
  Trailer get trailer => _trailer;

  String _message = '';
  String get message => _message;

  Future<void> fetchMovieTrailer(int id) async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await getMovieTrailer.execute(id);

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.error;
        notifyListeners();
      },
      (trailer) {
        _trailer = trailer;
        _state = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
