import 'package:flutter/material.dart';

class ImageResolver extends StatelessWidget {
  final String image;

  ImageResolver({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image.contains('http') || image.contains('https')) {
      return ClipOval(
        child: Image.network(
          image,
          width: 150.0,
        ),
      );
    } else {
      return ClipOval(
        child: Image.asset(
          image,
          width: 150.0,
        ),
      );
    }
  }
}
