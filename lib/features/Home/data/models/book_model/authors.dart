import 'package:hive/hive.dart';
part 'authors.g.dart';

@HiveType(typeId: 1)
class Authors {
  @HiveField(0)
  String? name;

  @HiveField(1)
  int? birthYear;

  @HiveField(2)
  int? deathYear;

  Authors({
    this.name,
    this.birthYear,
    this.deathYear,
  });

  factory Authors.fromJson(Map<String, dynamic> json) {
    return Authors(
      name: json['name'],
      birthYear: json['birth_year'],
      deathYear: json['death_year'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'birth_year': birthYear,
      'death_year': deathYear,
    };
  }
}
