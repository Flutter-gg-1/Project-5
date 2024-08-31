import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class ImgConverter {
  static Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  static Future<String> assetImgToData(AssetImage img) async {
    // Uint8List
    final ByteData bytes = await rootBundle.load(img.assetName);
    final Uint8List data = bytes.buffer.asUint8List();

    // Base64
    final String base64Image = base64String(data);

    // Base64 + metadata
    return 'data:image/jpg;base64,$base64Image';
  }
}
