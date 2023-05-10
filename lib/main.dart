import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_pro/common/constants.dart';
import 'package:movie_pro/common/utils.dart';
import 'package:movie_pro/injection.dart' as di;
import 'package:movie_pro/presentation/pages/about_page.dart';
import 'package:movie_pro/presentation/pages/home_page.dart';
import 'package:movie_pro/presentation/pages/movie_detail_page.dart';
import 'package:movie_pro/presentation/pages/now_playing_movies_page.dart';
import 'package:movie_pro/presentation/pages/now_playing_tv_series_page.dart';
import 'package:movie_pro/presentation/pages/popular_movies_page.dart';
import 'package:movie_pro/presentation/pages/popular_tv_series_page.dart';
import 'package:movie_pro/presentation/pages/search_page.dart';
import 'package:movie_pro/presentation/pages/top_rated_movies_page.dart';
import 'package:movie_pro/presentation/pages/top_rated_tv_series_page.dart';
import 'package:movie_pro/presentation/pages/tv_series_detail_page.dart';
import 'package:movie_pro/presentation/pages/upcoming_movies_page.dart';
import 'package:movie_pro/presentation/pages/watchlist_page.dart';
import 'package:movie_pro/presentation/provider/bottom_navigation_bar_provider.dart';
import 'package:movie_pro/presentation/provider/movie_detail_notifier.dart';
import 'package:movie_pro/presentation/provider/movie_list_notifier.dart';
import 'package:movie_pro/presentation/provider/movie_search_notifier.dart';
import 'package:movie_pro/presentation/provider/movie_trailer_notifier.dart';
import 'package:movie_pro/presentation/provider/now_playing_movies_notifier.dart';
import 'package:movie_pro/presentation/provider/now_playing_tv_series_notifier.dart';
import 'package:movie_pro/presentation/provider/popular_movies_notifier.dart';
import 'package:movie_pro/presentation/provider/top_rated_movies_notifier.dart';
import 'package:movie_pro/presentation/provider/upcoming_movies_notifier.dart';
import 'package:movie_pro/presentation/provider/watchlist_movie_notifier.dart';
import 'package:provider/provider.dart';

import 'presentation/provider/popular_tv_series_notifier.dart';
import 'presentation/provider/top_rated_tv_series_notifier.dart';
import 'presentation/provider/tv_series_detail_notifier.dart';
import 'presentation/provider/tv_series_list_notifier.dart';
import 'presentation/provider/tv_series_search_notifier.dart';
import 'presentation/provider/watchlist_tv_series_notifier.dart';

void main() {
  di.init();
  runApp(MoviePro());
}

class MoviePro extends StatelessWidget {
  const MoviePro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<BottomNavigationBarNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvSeriesListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvSeriesDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvSeriesSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<NowPlayingMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<NowPlayingTvSeriesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedTvSeriesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularTvSeriesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<UpcomingMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistMovieNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistTvSeriesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieTrailerNotifier>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(),
        theme: ThemeData.light().copyWith(
          colorScheme: kColorScheme,
        ),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => HomePage());
            case NowPlayingMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => NowPlayingMoviesPage());
            case NowPlayingTvSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(
                  builder: (_) => NowPlayingTvSeriesPage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case PopularTvSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularTvSeriesPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case TopRatedTvSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedTvSeriesPage());
            case UpcomingMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => UpcomingMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case TvSeriesDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvSeriesDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case WatchlistPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistPage());
            case AboutPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
