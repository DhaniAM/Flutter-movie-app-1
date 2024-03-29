import 'package:movie_pro/common/exception.dart';
import 'package:movie_pro/data/datasources/db/database_helper.dart';
import 'package:movie_pro/data/models/movie_table.dart';

abstract class MovieLocalDataSource {
  Future<String> insertWatchlist(MovieTable movie);
  Future<String> removeWatchlist(MovieTable movie);
  Future<MovieTable?> getMovieById(int id);
  Future<List<MovieTable>> getMovieWatchlist();
}

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final DatabaseHelper databaseHelper;

  MovieLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchlist(MovieTable movie) async {
    try {
      await databaseHelper.insertMovieWatchlist(movie);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlist(MovieTable movie) async {
    try {
      await databaseHelper.removeMovieWatchlist(movie);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<MovieTable?> getMovieById(int id) async {
    final result = await databaseHelper.getContentById(id);
    if (result != null) {
      return MovieTable.fromJson(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<MovieTable>> getMovieWatchlist() async {
    final result = await databaseHelper.getMovieWatchlist();
    return result.map((data) => MovieTable.fromJson(data)).toList();
  }
}
