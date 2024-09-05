import 'package:image_gallery_app/features/image_gallery/domain/entities/image.dart';

class ImageModel extends ImageEntity {
  ImageModel({required super.url, required super.likes, required super.views});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      url: json['webformatURL'],
      likes: json['likes'],
      views: json['views'],
    );
  }
}
