import 'package:flutter/material.dart';

class ImageResolver extends StatelessWidget {
  final String image;

  ImageResolver({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image.contains('http') || image.contains('https')) {
      return Image.network(image);
    } else {
      return Image.asset(image);
    }
  }
}
