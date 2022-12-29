import 'package:squadron/squadron.dart';
import 'dart:typed_data';
import 'image_service.dart';
import 'image_worker_activator.dart'
if (dart.library.js)   'package:flutter_image_transform/browser/image_worker_activator.dart'
if (dart.library.html) 'package:flutter_image_transform/browser/image_worker_activator.dart'
if (dart.library.io)   'package:flutter_image_transform/vm/image_worker_activator.dart';

class ImageWorkerPool extends WorkerPool<ImageWorker> implements ImageService
{
  ImageWorkerPool(ConcurrencySettings concurrencySettings) : super(createWorker, concurrencySettings: concurrencySettings);

  @override
  Future<String?> gray(Uint8List imageData) => execute((w) => w.gray(imageData));

  @override
  Future<String?> crop(Uint8List imageData, int x, int y, int width, int height) => execute((w) => w.crop(imageData, x, y, width, height));

  @override
  Future<String?> flip(Uint8List imageData, String axis) => execute((w) => w.flip(imageData, axis));

  @override
  Future<String?> resize(Uint8List imageData, int width, int height) => execute((w) => w.resize(imageData, width, height));
}

// Implementation of ThumbnailService as a Squadron worker
class ImageWorker extends Worker implements ImageService
{
  ImageWorker(dynamic entryPoint, {List args = const []}) : super(entryPoint, args: args);

  @override
  Future<String?> gray(Uint8List imageData) => send(ImageService.Gray, args: [imageData]);

  @override
  Future<String?> crop(Uint8List imageData, int x, int y, int width, int height) => send(ImageService.Crop, args: [imageData,x,y,width,height]);

  @override
  Future<String?> flip(Uint8List imageData, String axis) => send(ImageService.Flip, args: [imageData,axis]);

  @override
  Future<String?> resize(Uint8List imageData, int width, int height) => send(ImageService.Resize, args: [imageData,width, height]);
}
