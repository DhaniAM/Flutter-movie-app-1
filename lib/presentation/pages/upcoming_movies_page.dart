import 'package:flutter/material.dart';
import 'package:movie_pro/common/state_enum.dart';
import 'package:movie_pro/presentation/provider/upcoming_movies_notifier.dart';
import 'package:movie_pro/presentation/widgets/content_card_list.dart';
import 'package:provider/provider.dart';

class UpcomingMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/upcoming-movie';

  @override
  _UpcomingMoviesPageState createState() => _UpcomingMoviesPageState();
}

class _UpcomingMoviesPageState extends State<UpcomingMoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<UpcomingMoviesNotifier>(context, listen: false)
            .fetchUpcomingMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<UpcomingMoviesNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = data.movies[index];
                  return ContentCardList(movie);
                },
                itemCount: data.movies.length,
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ),
    );
  }
}
