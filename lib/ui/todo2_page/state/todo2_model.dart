import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'timestamp_converter.dart';

part 'todo2_model.freezed.dart';
part 'todo2_model.g.dart';

@freezed
class Todo2 with _$Todo2 {
  const factory Todo2({
    required String id,
    required String category,
    required String text,
    @Default(false) bool check,
    @TimestampConverter() DateTime? createdAt,
  }) = _Todo2;

  factory Todo2.fromJson(Map<String, dynamic> json) => _$Todo2FromJson(json);
}
