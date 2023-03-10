import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:movie_pro/data/datasources/db/database_helper.dart';
import 'package:movie_pro/data/datasources/movie_local_data_source.dart';
import 'package:movie_pro/data/datasources/movie_remote_data_source.dart';
import 'package:movie_pro/data/datasources/tv_series_local_data_source.dart';
import 'package:movie_pro/data/datasources/tv_series_remote_data_source.dart';
import 'package:movie_pro/domain/repositories/movie_repository.dart';
import 'package:movie_pro/domain/repositories/tv_series_repository.dart';

@GenerateMocks([
  MovieRepository,
  TvSeriesRepository,
  MovieRemoteDataSource,
  TvSeriesRemoteDataSource,
  MovieLocalDataSource,
  TvSeriesLocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
