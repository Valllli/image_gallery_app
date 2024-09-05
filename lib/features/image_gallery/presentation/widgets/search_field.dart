import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_app/features/image_gallery/presentation/bloc/image_bloc.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (_controller.text.isNotEmpty) {
        BlocProvider.of<ImageBloc>(context)
            .add(FetchImagesEvent(query: _controller.text, page: 1));
      } else {
        BlocProvider.of<ImageBloc>(context)
            .add(const FetchImagesEvent(query: '', page: 1));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        onChanged: (value) => _onSearchChanged(),
        decoration: InputDecoration(
          hintText: 'Search images...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
