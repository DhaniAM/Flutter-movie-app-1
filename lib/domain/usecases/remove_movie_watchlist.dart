import 'package:dartz/dartz.dart';
import 'package:movie_pro/common/failure.dart';
import 'package:movie_pro/data/repositories/movie_repository_impl.dart';
import 'package:movie_pro/domain/entities/movie_detail.dart';
import 'package:movie_pro/domain/repositories/movie_repository.dart';

class RemoveMovieWatchlist {
  final MovieRepository repository;

  RemoveMovieWatchlist(this.repository);

  /// Call [MovieRepositoryImpl].removeMoviesWatchlist
  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.removeMoviesWatchlist(movie);
  }
}
