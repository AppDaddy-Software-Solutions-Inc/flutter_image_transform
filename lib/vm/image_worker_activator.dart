import 'package:flutter_image_transform/image_worker_pool.dart' show ImageWorker;
import 'package:flutter_image_transform/vm/image_worker.dart' as isolate;

ImageWorker createWorker() => ImageWorker(isolate.start);
String get workerPlatform => 'vm';
