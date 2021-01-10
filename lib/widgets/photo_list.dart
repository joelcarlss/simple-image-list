import 'package:ImageList/models/photo.dart';
import 'package:ImageList/widgets/photo_list_item.dart';
import 'package:flutter/material.dart';

class PhotoList extends StatelessWidget {
  PhotoList(this.photos);
  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) => PhotoListItem(photos[index]),
    );
  }
}
