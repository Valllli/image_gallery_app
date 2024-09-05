import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_app/features/image_gallery/presentation/bloc/image_bloc.dart';
import 'package:image_gallery_app/features/image_gallery/presentation/pages/image_gallery_page.dart';

import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Gallery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => di.sl<ImageBloc>(),
        child: const ImageGalleryPage(),
      ),
    );
  }
}
