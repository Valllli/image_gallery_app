import 'package:dartz/dartz.dart';
import 'package:image_gallery_app/core/error/failures.dart';
import 'package:image_gallery_app/core/usecases/usecase.dart';
import 'package:image_gallery_app/features/image_gallery/domain/entities/image.dart';
import 'package:image_gallery_app/features/image_gallery/domain/repositories/image_repository.dart';

class GetImages implements UseCase<List<ImageEntity>, Params> {
  final ImageRepository repository;

  GetImages(this.repository);

  @override
  Future<Either<Failure, List<ImageEntity>>> call(Params params) async {
    return await repository.getImages(params.query, params.page);
  }
}

class Params {
  final String query;
  final int page;

  Params({required this.query, required this.page});
}
