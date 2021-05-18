import 'package:flutter/material.dart';

class CircularImageView extends StatelessWidget {
  final String imageUrl;

  const CircularImageView(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.grey,
        image: imageUrl.isNotEmpty ? DecorationImage(fit: BoxFit.cover, image: NetworkImage(imageUrl)) : null,
      ),
    );
  }
}
