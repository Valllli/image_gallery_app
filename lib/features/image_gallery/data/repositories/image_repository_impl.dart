import 'package:dartz/dartz.dart';
import 'package:image_gallery_app/core/error/exceptions.dart';
import 'package:image_gallery_app/core/error/failures.dart';
import 'package:image_gallery_app/features/image_gallery/data/datasources/image_remote_data_source.dart';
import 'package:image_gallery_app/features/image_gallery/domain/entities/image.dart';
import 'package:image_gallery_app/features/image_gallery/domain/repositories/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageRemoteDataSource remoteDataSource;

  ImageRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ImageEntity>>> getImages(
      String query, int page) async {
    try {
      final remoteImages = await remoteDataSource.getImages(query, page);
      return Right(remoteImages);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
