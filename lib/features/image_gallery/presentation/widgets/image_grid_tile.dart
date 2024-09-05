import 'package:flutter/material.dart';
import 'package:image_gallery_app/features/image_gallery/domain/entities/image.dart';
import 'package:image_gallery_app/features/image_gallery/presentation/pages/image_screen.dart';

/// Виджет отображает миниатюру изображения в галерее.
///
/// При нажатии на изображение открывает его на весь экран.
class ImageGridTile extends StatelessWidget {
  final ImageEntity image;

  const ImageGridTile({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ImageScreen(imageUrl: image.url),
          ),
        );
      },
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text('${image.likes} likes'),
          subtitle: Text('${image.views} views'),
        ),
        child: Image.network(image.url, fit: BoxFit.cover),
      ),
    );
  }
}
