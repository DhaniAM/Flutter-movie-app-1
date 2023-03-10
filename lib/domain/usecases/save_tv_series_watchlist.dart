import 'package:dartz/dartz.dart';
import 'package:movie_pro/common/failure.dart';
import 'package:movie_pro/data/repositories/tv_series_repository_impl.dart';
import 'package:movie_pro/domain/entities/tv_series_detail.dart';
import 'package:movie_pro/domain/repositories/tv_series_repository.dart';

class SaveTvSeriesWatchlist {
  final TvSeriesRepository repository;

  SaveTvSeriesWatchlist(this.repository);

  /// Call [TvSeriesRepositoryImpl].saveTvSeriesWatchlist(tvSeries)
  Future<Either<Failure, String>> execute(TvSeriesDetail tvSeries) {
    return repository.saveTvSeriesWatchlist(tvSeries);
  }
}
