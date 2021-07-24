class NearbyGroups {
  int id;
  String name;
  String title;
  String image;

  NearbyGroups({this.id, this.name, this.title, this.image});

  NearbyGroups.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'];
    title = json['title'];
    image = json['image'];
  }
}
