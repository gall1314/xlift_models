# xlift_models

TFLite models bundled as a Flutter package for the [Xlift](https://github.com/gall1314) fitness app.

## Why a package?

FlutterFlow doesn't allow uploading `.tflite` files as standard assets. Wrapping the model in a small Flutter package and adding it as a git dependency works around this — the model ships inside the package's `assets/` and is bundled with the host app's build.

## Usage

```yaml
# In the host app's pubspec.yaml
dependencies:
  xlift_models:
    git:
      url: https://github.com/gall1314/xlift_models.git
      ref: main
```

```dart
import 'package:xlift_models/xlift_models.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

final bytes = await XliftModels.loadBarbellModel();
final interpreter = Interpreter.fromBuffer(bytes);
// ... run inference, then interpreter.close();
```

## Models

| Model | Size | mAP50 | mAP50-95 | Notes |
|-------|------|-------|----------|-------|
| `barbell.tflite` | ~11 MB | 0.988 | 0.948 | YOLOv8s, 320x320, int8 quantized weights, trained on ~7,800 barbell images |

## Updating a model

1. Replace the file in `assets/`
2. Bump the `version` in `pubspec.yaml`
3. Commit and push
4. In the host app, run `flutter pub upgrade xlift_models` (or trigger a rebuild in FlutterFlow)
