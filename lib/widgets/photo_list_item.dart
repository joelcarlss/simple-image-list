import 'dart:async';

import 'package:ImageList/models/photo.dart';
import 'package:flutter/material.dart';

class PhotoListItem extends StatefulWidget {
  PhotoListItem(this.photo);

  final Photo photo;

  @override
  _PhotoListItemState createState() => _PhotoListItemState();
}

class _PhotoListItemState extends State<PhotoListItem> {
  int likes = 0;
  int dislikes = 0;
  bool _show = false;
  bool _showLike = false;
  Timer timer;

  @override
  void initState() {
    timer = Timer(Duration(milliseconds: 1000), () {
      setState(() {
        _show = true;
      });
    });
    super.initState();
  }

  setShowLike(shouldShow) {
    setState(() {
      _showLike = shouldShow;
    });
  }

  handleDoubleTap() {
    setShowLike(true);
    handleLike(true);
    Timer(Duration(milliseconds: 1000), () {
      setShowLike(false);
    });
  }

  handleLike(isLike) {
    if (isLike) {
      setState(() {
        this.likes += 1;
      });
    } else {
      setState(() {
        this.dislikes += 1;
      });
    }
  }

  final iconPadding = EdgeInsets.all(20);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _show ? 1 : 0,
      duration: Duration(microseconds: 900),
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(
            color: Colors.grey,
          ),
          Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(widget.photo.thumbnailUrl),
                fit: BoxFit.cover,
              )),
              child: AnimatedOpacity(
                opacity: _showLike ? 1 : 0,
                duration: _showLike
                    ? Duration(milliseconds: 100)
                    : Duration(milliseconds: 500),
                child: GestureDetector(
                  onDoubleTap: () => handleDoubleTap(),
                  child: Icon(Icons.favorite,
                      color: Colors.white70,
                      size: (MediaQuery.of(context).size.width) * 0.5),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(likes.toString()),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () => handleLike(true),
                padding: iconPadding,
              ),
              IconButton(
                icon: Icon(Icons.thumb_down),
                onPressed: () => handleLike(false),
                padding: iconPadding,
              ),
              Text(dislikes.toString())
            ],
          )
        ],
      )),
    );
  }
}
