import 'package:dartz/dartz.dart';
import 'package:movie_pro/common/failure.dart';
import 'package:movie_pro/domain/entities/tv_series_detail.dart';
import 'package:movie_pro/domain/repositories/tv_series_repository.dart';

class RemoveTvSeriesWatchlist {
  final TvSeriesRepository repository;

  RemoveTvSeriesWatchlist(this.repository);

  /// Call [TvSeriesRepository].removeTvSeriesWatchlist(tvSeries)
  Future<Either<Failure, String>> execute(TvSeriesDetail tvSeries) {
    return repository.removeTvSeriesWatchlist(tvSeries);
  }
}
