import 'package:dartz/dartz.dart';
import 'package:movie_pro/common/failure.dart';
import 'package:movie_pro/data/repositories/movie_repository_impl.dart';
import 'package:movie_pro/domain/entities/movie.dart';
import 'package:movie_pro/domain/entities/movie_detail.dart';
import 'package:movie_pro/domain/entities/trailer.dart';

/// Interface
/// Implementation on [MovieRepositoryImpl]
abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetail(int id);
  Future<Either<Failure, List<Movie>>> getMovieRecommendations(int id);
  Future<Either<Failure, List<Movie>>> getUpcomingMovies();
  Future<Either<Failure, Trailer>> getMovieTrailer(int id);
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
  Future<Either<Failure, String>> saveMoviesWatchlist(MovieDetail movie);
  Future<Either<Failure, String>> removeMoviesWatchlist(MovieDetail movie);
  Future<bool> isMoviesAddedToWatchlist(int id);
  Future<Either<Failure, List<Movie>>> getWatchlistMovies();
}
