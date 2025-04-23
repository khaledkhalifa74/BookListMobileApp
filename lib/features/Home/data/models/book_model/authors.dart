class Authors {
  String? name;
  int? birthYear;
  int? deathYear;

  Authors({this.name, this.birthYear, this.deathYear});

  Authors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    birthYear = json['birth_year'];
    deathYear = json['death_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['birth_year'] = birthYear;
    data['death_year'] = deathYear;
    return data;
  }
}
