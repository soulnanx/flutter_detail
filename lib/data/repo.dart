class Repo {
  int id;
  String name;

  Repo({this.id, this.name});

  factory Repo.fromJson(Map<String, dynamic> json) {
    return Repo(
      id: json['id'] ??= 0 ,
      name: json['name'] ??= ""
    );
  }

}