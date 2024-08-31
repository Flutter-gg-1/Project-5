import 'dart:convert';
import 'package:flutter/material.dart';

Image decodeImageAsBase64(String imageAsBase64) {
  final image = base64Decode(imageAsBase64);
  return Image.memory(image);
}