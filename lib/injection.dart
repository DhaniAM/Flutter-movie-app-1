import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:movie_pro/data/datasources/db/database_helper.dart';
import 'package:movie_pro/data/datasources/movie_local_data_source.dart';
import 'package:movie_pro/data/datasources/movie_remote_data_source.dart';
import 'package:movie_pro/data/datasources/tv_series_local_data_source.dart';
import 'package:movie_pro/data/datasources/tv_series_remote_data_source.dart';
import 'package:movie_pro/data/repositories/movie_repository_impl.dart';
import 'package:movie_pro/data/repositories/tv_series_repository_impl.dart';
import 'package:movie_pro/domain/repositories/movie_repository.dart';
import 'package:movie_pro/domain/repositories/tv_series_repository.dart';
import 'package:movie_pro/domain/usecases/get_movie_detail.dart';
import 'package:movie_pro/domain/usecases/get_movie_recommendations.dart';
import 'package:movie_pro/domain/usecases/get_movie_trailer.dart';
import 'package:movie_pro/domain/usecases/get_movie_watchlist_status.dart';
import 'package:movie_pro/domain/usecases/get_now_playing_movies.dart';
import 'package:movie_pro/domain/usecases/get_now_playing_tv_series.dart';
import 'package:movie_pro/domain/usecases/get_popular_movies.dart';
import 'package:movie_pro/domain/usecases/get_popular_tv_series.dart';
import 'package:movie_pro/domain/usecases/get_top_rated_movies.dart';
import 'package:movie_pro/domain/usecases/get_top_rated_tv_series.dart';
import 'package:movie_pro/domain/usecases/get_tv_series_detail.dart';
import 'package:movie_pro/domain/usecases/get_tv_series_recommendations.dart';
import 'package:movie_pro/domain/usecases/get_tv_series_watchlist_status.dart';
import 'package:movie_pro/domain/usecases/get_upcoming_movies.dart';
import 'package:movie_pro/domain/usecases/get_watchlist_movies.dart';
import 'package:movie_pro/domain/usecases/get_watchlist_tv_series.dart';
import 'package:movie_pro/domain/usecases/remove_movie_watchlist.dart';
import 'package:movie_pro/domain/usecases/remove_tv_series_watchlist.dart';
import 'package:movie_pro/domain/usecases/save_movie_watchlist.dart';
import 'package:movie_pro/domain/usecases/save_tv_series_watchlist.dart';
import 'package:movie_pro/domain/usecases/search_movies.dart';
import 'package:movie_pro/domain/usecases/search_tv_series.dart';
import 'package:movie_pro/presentation/provider/bottom_navigation_bar_provider.dart';
import 'package:movie_pro/presentation/provider/movie_detail_notifier.dart';
import 'package:movie_pro/presentation/provider/movie_list_notifier.dart';
import 'package:movie_pro/presentation/provider/movie_search_notifier.dart';
import 'package:movie_pro/presentation/provider/movie_trailer_notifier.dart';
import 'package:movie_pro/presentation/provider/now_playing_movies_notifier.dart';
import 'package:movie_pro/presentation/provider/now_playing_tv_series_notifier.dart';
import 'package:movie_pro/presentation/provider/popular_movies_notifier.dart';
import 'package:movie_pro/presentation/provider/popular_tv_series_notifier.dart';
import 'package:movie_pro/presentation/provider/top_rated_movies_notifier.dart';
import 'package:movie_pro/presentation/provider/top_rated_tv_series_notifier.dart';
import 'package:movie_pro/presentation/provider/tv_series_detail_notifier.dart';
import 'package:movie_pro/presentation/provider/tv_series_list_notifier.dart';
import 'package:movie_pro/presentation/provider/tv_series_search_notifier.dart';
import 'package:movie_pro/presentation/provider/upcoming_movies_notifier.dart';
import 'package:movie_pro/presentation/provider/watchlist_movie_notifier.dart';
import 'package:movie_pro/presentation/provider/watchlist_tv_series_notifier.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(() => BottomNavigationBarNotifier());
  locator.registerFactory(
    () => MovieListNotifier(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
      getUpcomingMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesListNotifier(
      getNowPlayingTvSeries: locator(),
      getPopularTvSeries: locator(),
      getTopRatedTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailNotifier(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getMovieWatchListStatus: locator(),
      saveMovieWatchlist: locator(),
      removeMovieWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesDetailNotifier(
      getTvSeriesDetail: locator(),
      getTvSeriesRecommendations: locator(),
      getTvSeriesWatchListStatus: locator(),
      saveTvSeriesWatchlist: locator(),
      removeTvSeriesWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieSearchNotifier(
      searchMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesSearchNotifier(
      searchTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => UpcomingMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularTvSeriesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => NowPlayingMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => NowPlayingTvSeriesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieTrailerNotifier(
      locator(),
    ),
  );

  locator.registerFactory(
    () => TopRatedMoviesNotifier(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedTvSeriesNotifier(
      getTopRatedTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieNotifier(
      getWatchlistMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistTvSeriesNotifier(
      getWatchlistTvSeries: locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetNowPlayingTvSeries(locator()));

  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetPopularTvSeries(locator()));

  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvSeries(locator()));

  locator.registerLazySingleton(() => GetUpcomingMovies(locator()));

  locator.registerLazySingleton(() => GetMovieTrailer(locator()));

  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetTvSeriesDetail(locator()));

  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => GetTvSeriesRecommendations(locator()));

  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => SearchTvSeries(locator()));

  locator.registerLazySingleton(() => GetMovieWatchListStatus(locator()));
  locator.registerLazySingleton(() => GetTvSeriesWatchListStatus(locator()));

  locator.registerLazySingleton(() => SaveMovieWatchlist(locator()));
  locator.registerLazySingleton(() => SaveTvSeriesWatchlist(locator()));

  locator.registerLazySingleton(() => RemoveMovieWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveTvSeriesWatchlist(locator()));

  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvSeries(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TvSeriesRepository>(
    () => TvSeriesRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvSeriesRemoteDataSource>(
      () => TvSeriesRemoteDataSourceImpl(client: locator()));

  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<TvSeriesLocalDataSource>(
      () => TvSeriesLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
