import 'package:movie_pro/data/repositories/movie_repository_impl.dart';
import 'package:movie_pro/domain/repositories/movie_repository.dart';

class GetMovieWatchListStatus {
  final MovieRepository repository;

  GetMovieWatchListStatus(this.repository);

  /// Call [MovieRepositoryImpl].isMoviesAddedToWatchlist
  Future<bool> execute(int id) async {
    return repository.isMoviesAddedToWatchlist(id);
  }
}
