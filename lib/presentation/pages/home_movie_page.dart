import 'package:flutter/material.dart';
import 'package:movie_pro/common/constants.dart';
import 'package:movie_pro/common/state_enum.dart';
import 'package:movie_pro/presentation/pages/now_playing_movies_page.dart';
import 'package:movie_pro/presentation/pages/popular_movies_page.dart';
import 'package:movie_pro/presentation/pages/top_rated_movies_page.dart';
import 'package:movie_pro/presentation/pages/upcoming_movies_page.dart';
import 'package:movie_pro/presentation/provider/movie_list_notifier.dart';
import 'package:movie_pro/presentation/widgets/content_card.dart';
import 'package:provider/provider.dart';

class HomeMoviePage extends StatefulWidget {
  const HomeMoviePage();
  @override
  _HomeMoviePageState createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<MovieListNotifier>(context, listen: false)
          ..fetchNowPlayingMovies()
          ..fetchPopularMovies()
          ..fetchTopRatedMovies()
          ..fetchUpcomingMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSubHeading(
              title: 'Now Playing',
              onTap: () =>
                  Navigator.pushNamed(context, NowPlayingMoviesPage.ROUTE_NAME),
            ),
            Consumer<MovieListNotifier>(builder: (context, data, child) {
              final state = data.nowPlayingState;
              if (state == RequestState.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == RequestState.loaded) {
                return ContentCard(data.nowPlayingMovies);
              } else {
                return Text('Failed');
              }
            }),
            _buildSubHeading(
              title: 'Popular',
              onTap: () =>
                  Navigator.pushNamed(context, PopularMoviesPage.ROUTE_NAME),
            ),
            Consumer<MovieListNotifier>(builder: (context, data, child) {
              final state = data.popularMoviesState;
              if (state == RequestState.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == RequestState.loaded) {
                return ContentCard(data.popularMovies);
              } else {
                return Text('Failed');
              }
            }),
            _buildSubHeading(
              title: 'Top Rated',
              onTap: () =>
                  Navigator.pushNamed(context, TopRatedMoviesPage.ROUTE_NAME),
            ),
            Consumer<MovieListNotifier>(builder: (context, data, child) {
              final state = data.topRatedMoviesState;
              if (state == RequestState.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == RequestState.loaded) {
                return ContentCard(data.topRatedMovies);
              } else {
                return Text('Failed');
              }
            }),
            _buildSubHeading(
              title: 'Upcoming',
              onTap: () =>
                  Navigator.pushNamed(context, UpcomingMoviesPage.ROUTE_NAME),
            ),
            Consumer<MovieListNotifier>(builder: (context, data, child) {
              final state = data.upcomingMoviesState;
              if (state == RequestState.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == RequestState.loaded) {
                return ContentCard(data.upcomingMovies);
              } else {
                return Text('Failed');
              }
            }),
          ],
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}
