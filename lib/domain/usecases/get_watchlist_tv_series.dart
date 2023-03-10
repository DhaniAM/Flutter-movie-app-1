import 'package:dartz/dartz.dart';
import 'package:movie_pro/common/failure.dart';
import 'package:movie_pro/data/repositories/tv_series_repository_impl.dart';
import 'package:movie_pro/domain/entities/tv_series.dart';
import 'package:movie_pro/domain/repositories/tv_series_repository.dart';

class GetWatchlistTvSeries {
  final TvSeriesRepository _repository;

  GetWatchlistTvSeries(this._repository);

  /// Call [TvSeriesRepositoryImpl].getWatchlistTvSeries
  Future<Either<Failure, List<TvSeries>>> execute() {
    return _repository.getWatchlistTvSeries();
  }
}
