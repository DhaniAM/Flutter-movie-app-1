import 'package:flutter_test/flutter_test.dart';
import 'package:movie_pro/data/models/genre_model.dart';

void main() {
  final genreJson = {"id": 1, "name": "name"};

  test('should return genre model', () {
    final testGenre = GenreModel(id: 1, name: "name");

    final testGenreToJson = testGenre.toJson();

    expect(testGenreToJson, genreJson);
  });
}
