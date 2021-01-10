import 'dart:convert';
import 'package:ImageList/models/photo.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetchPhotos() async {
  final response = await http.get(
      'https://api.unsplash.com/photos/?client_id=rbDglrMyfqWVXANcAGak5Q9O06uHA4SU-tLz7UFluNU');

  if (response.statusCode == 200) {
    dynamic apiResponseBody = json.decode(response.body);

    var casted = apiResponseBody.cast<Map<String, dynamic>>();

    return casted.map<Photo>((photo) => Photo.fromJson(photo)).toList();
  } else {
    throw Exception('Failed to load photos');
  }
}
