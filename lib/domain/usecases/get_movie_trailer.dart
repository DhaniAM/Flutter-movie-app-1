import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/repositories/movie_repository_impl.dart';
import 'package:ditonton/domain/entities/trailer.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';

class GetMovieTrailer {
  final MovieRepository repository;

  GetMovieTrailer(this.repository);

  /// Call [MovieRepositoryImpl].getMovieDetail
  Future<Either<Failure, Trailer>> execute(int id) {
    return repository.getMovieTrailer(id);
  }
}
