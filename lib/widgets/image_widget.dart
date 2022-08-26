// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {

  String? imageFundo;
  Function()? aoClicar;

  ImageWidget({
    Key? key,
    this.imageFundo,
    this.aoClicar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: aoClicar,
        child: CircleAvatar(
          maxRadius: 48,
          minRadius: 28,
          backgroundImage: AssetImage(imageFundo ?? ''),
        ),
      ),
    );
  }
}
