import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
// import 'timestamp_converter.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    required String id,
    required String title,
    required String text,
    required String image,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}
