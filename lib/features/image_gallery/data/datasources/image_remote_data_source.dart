import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_gallery_app/core/error/exceptions.dart';
import 'package:image_gallery_app/features/image_gallery/data/models/image_model.dart';

abstract class ImageRemoteDataSource {
  Future<List<ImageModel>> getImages(String query, int page);
}

class ImageRemoteDataSourceImpl implements ImageRemoteDataSource {
  final http.Client client;
  static const String apiKey = '45664192-748db6e264cd8cf9727c15f18';
  static const String apiUrl = 'https://pixabay.com/api/';

  ImageRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ImageModel>> getImages(String query, int page) async {
    final response = await client.get(
      Uri.parse(
          '$apiUrl?key=$apiKey&q=$query&image_type=photo&page=$page&per_page=20'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['hits'];
      return jsonData.map((json) => ImageModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }
}
