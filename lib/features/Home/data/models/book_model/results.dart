import 'package:book_list_app/features/Home/data/models/book_model/authors.dart';
import 'package:book_list_app/features/Home/data/models/book_model/formats.dart';

class Results {
  int? id;
  String? title;
  List<Authors>? authors;
  List<String>? summaries;
  Formats? formats;

  Results(
      {this.id,
        this.title,
        this.authors,
        this.summaries,
        this.formats,
      });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['authors'] != null) {
      authors = <Authors>[];
      json['authors'].forEach((v) {
        authors!.add(Authors.fromJson(v));
      });
    }
    summaries = json['summaries'].cast<String>();
    formats =
    json['formats'] != null ? Formats.fromJson(json['formats']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (authors != null) {
      data['authors'] = authors!.map((v) => v.toJson()).toList();
    }
    data['summaries'] = summaries;
    if (formats != null) {
      data['formats'] = formats!.toJson();
    }
    return data;
  }
}
