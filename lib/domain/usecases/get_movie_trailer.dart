import 'package:dartz/dartz.dart';
import 'package:movie_pro/common/failure.dart';
import 'package:movie_pro/data/repositories/movie_repository_impl.dart';
import 'package:movie_pro/domain/entities/trailer.dart';
import 'package:movie_pro/domain/repositories/movie_repository.dart';

class GetMovieTrailer {
  final MovieRepository repository;

  GetMovieTrailer(this.repository);

  /// Call [MovieRepositoryImpl].getMovieDetail
  Future<Either<Failure, Trailer>> execute(int id) {
    return repository.getMovieTrailer(id);
  }
}
