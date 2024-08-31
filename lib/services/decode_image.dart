import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

ImageProvider decodeImageAsBase64(String? imageAsBase64) {
  if (imageAsBase64 == null || imageAsBase64.isEmpty) {
    return const AssetImage('assets/images/default.png');
  }
  try {
    final Uint8List imageBytes = base64Decode(imageAsBase64);
    return MemoryImage(imageBytes);
  } catch (e) {
    return const AssetImage('assets/images/default.png');
  }
}