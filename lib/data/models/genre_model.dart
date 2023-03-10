import 'package:equatable/equatable.dart';
import 'package:movie_pro/domain/entities/genre.dart';

class GenreModel extends Equatable {
  GenreModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  /// Convert JSON/Database to [GenreModel]
  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
      );

  /// Convert from [GenreModel] to JSON or Map<String, dynamic>
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  /// Convert from [GenreModel] to [Genre] object
  Genre toEntity() {
    return Genre(id: this.id, name: this.name);
  }

  @override
  List<Object?> get props => [id, name];
}
