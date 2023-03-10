import 'package:dartz/dartz.dart';
import 'package:movie_pro/common/failure.dart';
import 'package:movie_pro/domain/entities/tv_series.dart';
import 'package:movie_pro/domain/repositories/tv_series_repository.dart';

class GetTopRatedTvSeries {
  final TvSeriesRepository repository;

  GetTopRatedTvSeries(this.repository);

  /// Call [TvSeriesRepository].getTopRatedTvSeries
  Future<Either<Failure, List<TvSeries>>> execute() {
    return repository.getTopRatedTvSeries();
  }
}
