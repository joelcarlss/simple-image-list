class Photo {
  final String id;
  final String thumbnailUrl;

  Photo({this.id, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(id: json['id'], thumbnailUrl: json['urls']['regular']);
  }
}
