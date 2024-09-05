import 'package:flutter/material.dart';

/// Страница отображает изображение на весь экран.
///
/// Принимает URL изображения и отображает его, поддерживая возможность вернуться назад.
class ImageScreen extends StatelessWidget {
  final String imageUrl;

  const ImageScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Center(
          child: Hero(
            tag: imageUrl,
            child: Image.network(imageUrl, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
