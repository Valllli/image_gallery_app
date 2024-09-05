import 'package:dartz/dartz.dart';
import 'package:image_gallery_app/core/error/failures.dart';
import 'package:image_gallery_app/features/image_gallery/domain/entities/image.dart';

abstract class ImageRepository {
  Future<Either<Failure, List<ImageEntity>>> getImages(String query, int page);
}
