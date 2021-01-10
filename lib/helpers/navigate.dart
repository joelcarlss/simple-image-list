import 'package:flutter/material.dart';

navigateToScreen(context, screen) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));

goToPrevScreen(context) => Navigator.pop(context);
