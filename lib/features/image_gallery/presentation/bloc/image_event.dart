part of 'image_bloc.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class FetchImagesEvent extends ImageEvent {
  final String query;
  final int page;

  const FetchImagesEvent({required this.query, required this.page});

  @override
  List<Object> get props => [query, page];
}
