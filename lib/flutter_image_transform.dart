library flutter_image_transform;
export 'flutter_image_transform.dart' show ImageTransformIsolate;

import 'dart:typed_data';
import 'package:flutter_image_transform/image_service.dart';
import 'package:squadron/squadron.dart';
import 'image_worker_pool.dart';

/// Image Trasnformer Isolate
class ImageTransformIsolate
{
  late final ImageWorkerPool _imageWorkerPool;

  ImageTransformIsolate({int? minWorkers = 1, int? maxWorkers = 4, int? maxParallel: 4})
  {
    _imageWorkerPool = ImageWorkerPool(ConcurrencySettings(minWorkers: minWorkers ?? 1, maxWorkers: maxWorkers ?? 4, maxParallel: maxParallel ?? 2));
  }

  Future<String?> gray(Uint8List bytes) async
  {
    String? uri;
    try
    {
      uri = await _imageWorkerPool.gray(bytes);
    }
    catch(e)
    {
      print('Error transforming to gray scale. Error is $e');
    }
    return uri;
  }

  Future<String?> flipVerically(Uint8List bytes) async
  {
    String? uri;
    try
    {
      uri = await _imageWorkerPool.flip(bytes, "vertical");
    }
    catch(e)
    {
      print('Error flipping image. Error is $e');
    }
    return uri;
  }

  Future<String?> flipHorizontally(Uint8List bytes) async
  {
    String? uri;
    try
    {
      uri = await _imageWorkerPool.flip(bytes, "horizontal");
    }
    catch(e)
    {
      print('Error flipping image. Error is $e');
    }
    return uri;
  }

  Future<String?> crop(Uint8List bytes, int x, int y, int width, int height) async
  {
    String? uri;
    try
    {
      uri = await _imageWorkerPool.crop(bytes, x, y, width, height);
    }
    catch(e)
    {
      print('Error cropping image. Error is $e');
    }
    return uri;
  }

  Future<String?> resize(Uint8List bytes, int width, int height) async
  {
    String? uri;
    try
    {
      uri = await _imageWorkerPool.resize(bytes, width, height);
    }
    catch(e)
    {
      print('Error resizing image. Error is $e');
    }
    return uri;
  }
}
