import 'package:dartz/dartz.dart';
import 'package:movie_pro/common/failure.dart';
import 'package:movie_pro/data/repositories/movie_repository_impl.dart';
import 'package:movie_pro/domain/entities/movie.dart';
import 'package:movie_pro/domain/repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  /// Call [MovieRepositoryImpl].getPopularMovies
  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getPopularMovies();
  }
}
