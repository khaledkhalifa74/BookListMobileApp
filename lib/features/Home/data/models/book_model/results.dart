import 'package:book_list_app/features/Home/data/models/book_model/authors.dart';
import 'package:book_list_app/features/Home/data/models/book_model/formats.dart';
import 'package:hive/hive.dart';
part 'results.g.dart';


@HiveType(typeId: 0)
class Results extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  List<Authors>? authors;

  @HiveField(3)
  List<String>? summaries;

  @HiveField(4)
  Formats? formats;

  Results({
    this.id,
    this.title,
    this.authors,
    this.summaries,
    this.formats,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      id: json['id'],
      title: json['title'],
      authors: json['authors'] != null
          ? List<Authors>.from(json['authors'].map((x) => Authors.fromJson(x)))
          : null,
      summaries: json['summaries'] != null
          ? List<String>.from(json['summaries'])
          : null,
      formats: json['formats'] != null
          ? Formats.fromJson(json['formats'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'authors': authors?.map((x) => x.toJson()).toList(),
    'summaries': summaries,
    'formats': formats?.toJson(),
  };
}
