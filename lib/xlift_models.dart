library xlift_models;

import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

/// Static accessors for Xlift's bundled TFLite models.
///
/// Models are bundled inside the package's assets and loaded via
/// `rootBundle.load('packages/xlift_models/...')`. This works in any Flutter
/// app that depends on `xlift_models` (including FlutterFlow builds) without
/// needing the host app to re-declare the assets.
class XliftModels {
  XliftModels._();

  /// Path of the barbell detector model inside the package.
  /// YOLOv8s trained on ~7,800 barbell images. mAP50 = 0.988.
  static const String _barbellAssetKey =
      'packages/xlift_models/assets/barbell.tflite';

  /// Loads the barbell detection model bytes.
  ///
  /// Pass the result to `Interpreter.fromBuffer(bytes)` from `tflite_flutter`.
  /// Bytes are not cached by this method — the caller should hold the
  /// `Interpreter` for as long as it's needed and close it when done.
  static Future<Uint8List> loadBarbellModel() async {
    final ByteData data = await rootBundle.load(_barbellAssetKey);
    return data.buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    );
  }

  /// Returns the raw asset path of the barbell model, in case you want to
  /// access it directly via `rootBundle`.
  static String get barbellAssetPath => _barbellAssetKey;
}
