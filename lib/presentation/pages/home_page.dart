import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:ditonton/presentation/pages/home_tv_series_page.dart';
import 'package:ditonton/presentation/pages/now_playing_movies_page.dart';
import 'package:ditonton/presentation/pages/now_playing_tv_series_page.dart';
import 'package:ditonton/presentation/pages/popular_movies_page.dart';
import 'package:ditonton/presentation/pages/popular_tv_series_page.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:ditonton/presentation/pages/top_rated_movies_page.dart';
import 'package:ditonton/presentation/pages/top_rated_tv_series_page.dart';
import 'package:ditonton/presentation/pages/upcoming_movies_page.dart';
import 'package:ditonton/presentation/pages/watchlist_page.dart';
import 'package:ditonton/presentation/provider/bottom_navigation_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<BottomNavigationBarNotifier>(context, listen: false)
            .changeIndex(0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile-pic.jpg'),
              ),
              accountName: Text('Movie Pro'),
              accountEmail: Text('dhani.a.mm@gmail.com'),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg-img.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Home'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.format_list_bulleted),
                      title: Text('Watchlist'),
                      onTap: () {
                        Navigator.pushNamed(context, WatchlistPage.ROUTE_NAME);
                      },
                    ),
                    const Divider(
                      color: kPrussianBlue,
                      height: 5,
                      thickness: 0.3,
                      indent: 15,
                      endIndent: 15,
                    ),
                    ListTile(
                      leading: Icon(Icons.play_circle),
                      title: Text('Now Playing Movies'),
                      onTap: () {
                        Navigator.pushNamed(
                            context, NowPlayingMoviesPage.ROUTE_NAME);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.show_chart),
                      title: Text('Top Rated Movies'),
                      onTap: () {
                        Navigator.pushNamed(
                            context, TopRatedMoviesPage.ROUTE_NAME);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.star_rounded),
                      title: Text('Popular Movies'),
                      onTap: () {
                        Navigator.pushNamed(
                            context, PopularMoviesPage.ROUTE_NAME);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.ondemand_video),
                      title: Text('Upcoming Movies'),
                      onTap: () {
                        Navigator.pushNamed(
                            context, UpcomingMoviesPage.ROUTE_NAME);
                      },
                    ),
                    const Divider(
                      color: kPrussianBlue,
                      height: 5,
                      thickness: 0.3,
                      indent: 15,
                      endIndent: 15,
                    ),
                    ListTile(
                      leading: Icon(Icons.play_circle),
                      title: Text('Now Playing Tv Series'),
                      onTap: () {
                        Navigator.pushNamed(
                            context, NowPlayingTvSeriesPage.ROUTE_NAME);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.show_chart),
                      title: Text('Top Rated Tv Series'),
                      onTap: () {
                        Navigator.pushNamed(
                            context, TopRatedTvSeriesPage.ROUTE_NAME);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.star_rounded),
                      title: Text('Popular Tv Series'),
                      onTap: () {
                        Navigator.pushNamed(
                            context, PopularTvSeriesPage.ROUTE_NAME);
                      },
                    ),
                    const Divider(
                      color: kPrussianBlue,
                      height: 5,
                      thickness: 0.3,
                      indent: 15,
                      endIndent: 15,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
                      },
                      leading: Icon(Icons.info_outlined),
                      title: Text('About'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Consumer<BottomNavigationBarNotifier>(
        builder: (context, value, child) {
          final RequestState state = value.requestState;
          if (state == RequestState.loaded) {
            if (value.index == 0) {
              return HomeMoviePage();
            } else {
              return HomeTvSeriesPage();
            }
          } else if (state == RequestState.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text('Failed'),
            );
          }
        },
      ),
      bottomNavigationBar: Consumer<BottomNavigationBarNotifier>(
        builder: (context, data, _) {
          return BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: 'Movies',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books_sharp),
                label: 'Tv Series',
              ),
            ],
            selectedItemColor: kBrightBlue,
            currentIndex: data.index,
            onTap: (value) => data.changeIndex(value),
          );
        },
      ),
    );
  }
}
