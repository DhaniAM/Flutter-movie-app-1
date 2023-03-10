import 'package:dartz/dartz.dart';
import 'package:movie_pro/common/failure.dart';
import 'package:movie_pro/data/repositories/movie_repository_impl.dart';
import 'package:movie_pro/domain/entities/movie.dart';
import 'package:movie_pro/domain/repositories/movie_repository.dart';

class GetMovieRecommendations {
  final MovieRepository repository;

  GetMovieRecommendations(this.repository);

  /// Call [MovieRepositoryImpl].getMovieRecommendations
  Future<Either<Failure, List<Movie>>> execute(id) {
    return repository.getMovieRecommendations(id);
  }
}
