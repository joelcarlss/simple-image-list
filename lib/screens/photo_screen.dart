import 'package:ImageList/actions/fetch_data.dart';
import 'package:ImageList/models/photo.dart';
import 'package:ImageList/widgets/photo_list.dart';
import 'package:flutter/material.dart';

class PhotoScreen extends StatefulWidget {
  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  Future<List<Photo>> futurePhotos;

  @override
  void initState() {
    futurePhotos = fetchPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: futurePhotos,
            builder: (context, snapshot) {
              if (snapshot.hasError) return Text(snapshot.error.toString());
              if (snapshot.hasData) return PhotoList(snapshot.data);
              return Center(child: CircularProgressIndicator());
            },
          ))
        ],
      ),
    );
  }
}
