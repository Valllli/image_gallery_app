import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_gallery_app/features/image_gallery/domain/entities/image.dart';
import 'package:image_gallery_app/features/image_gallery/domain/usecases/get_images.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final GetImages getImages;

  ImageBloc({required this.getImages}) : super(ImageInitial()) {
    on<FetchImagesEvent>(_onFetchImages);
  }

  void _onFetchImages(FetchImagesEvent event, Emitter<ImageState> emit) async {
    emit(ImageLoading());
    final failureOrImages =
        await getImages(Params(query: event.query, page: event.page));
    emit(failureOrImages.fold(
      (failure) => const ImageError(message: 'Failed to fetch images'),
      (images) => ImageLoaded(images: images),
    ));
  }
}
