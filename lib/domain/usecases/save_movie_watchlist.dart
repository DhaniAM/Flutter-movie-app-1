import 'package:dartz/dartz.dart';
import 'package:movie_pro/common/failure.dart';
import 'package:movie_pro/data/repositories/movie_repository_impl.dart';
import 'package:movie_pro/domain/entities/movie_detail.dart';
import 'package:movie_pro/domain/repositories/movie_repository.dart';

class SaveMovieWatchlist {
  final MovieRepository repository;

  SaveMovieWatchlist(this.repository);

  /// Call [MovieRepositoryImpl].saveMoviesWatchlist(movie)
  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.saveMoviesWatchlist(movie);
  }
}
