import 'package:flutter_image_transform/image_worker_pool.dart' show ImageWorker;

ImageWorker createWorker() => ImageWorker('/workers/image_worker.dart.js');
String get workerPlatform => 'browser';
