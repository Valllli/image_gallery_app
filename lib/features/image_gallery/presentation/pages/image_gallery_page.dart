import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_app/features/image_gallery/presentation/bloc/image_bloc.dart';
import 'package:image_gallery_app/features/image_gallery/presentation/widgets/image_grid_tile.dart';
import 'package:image_gallery_app/features/image_gallery/presentation/widgets/search_field.dart';

class ImageGalleryPage extends StatefulWidget {
  const ImageGalleryPage({super.key});

  @override
  State<ImageGalleryPage> createState() => _ImageGalleryPageState();
}

class _ImageGalleryPageState extends State<ImageGalleryPage> {
  @override
  void initState() {
    super.initState();
    // Запрашиваем изображения при инициализации виджета
    context.read<ImageBloc>().add(const FetchImagesEvent(query: '', page: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
      ),
      body: Column(
        children: [
          const SearchField(),
          Expanded(
            child: BlocBuilder<ImageBloc, ImageState>(
              builder: (context, state) {
                if (state is ImageLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ImageLoaded) {
                  return LayoutBuilder(builder: (context, constraints) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getCrossAxisCount(constraints.maxWidth),
                        childAspectRatio: 1,
                      ),
                      itemCount: state.images.length,
                      itemBuilder: (context, index) {
                        final image = state.images[index];
                        return ImageGridTile(image: image);
                      },
                    );
                  });
                } else if (state is ImageError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text('No images found'));
              },
            ),
          ),
        ],
      ),
    );
  }

  int getCrossAxisCount(double width) {
    if (width > 1200) {
      return 6; // Колонки для очень широких экранов
    } else if (width > 900) {
      return 4; // Колонки для средних экранов (планшеты)
    } else if (width > 600) {
      return 3; // Колонки для небольших экранов
    } else {
      return 2; // Колонки для телефонов
    }
  }
}
