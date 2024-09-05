import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_app/features/image_gallery/data/datasources/image_remote_data_source.dart';
import 'package:image_gallery_app/features/image_gallery/data/repositories/image_repository_impl.dart';
import 'package:image_gallery_app/features/image_gallery/domain/repositories/image_repository.dart';
import 'package:image_gallery_app/features/image_gallery/domain/usecases/get_images.dart';
import 'package:image_gallery_app/features/image_gallery/presentation/bloc/image_bloc.dart';

final sl = GetIt.instance;

void init() {
  // Bloc
  sl.registerFactory(() => ImageBloc(getImages: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetImages(sl()));

  // Repository
  sl.registerLazySingleton<ImageRepository>(
    () => ImageRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<ImageRemoteDataSource>(
    () => ImageRemoteDataSourceImpl(client: sl()),
  );

  // External
  sl.registerLazySingleton(() => http.Client());
}
