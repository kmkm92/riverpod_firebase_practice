import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firebase_practice/ui/todo2_page/pages/add2_page.dart';
import '/ui/todo2_page/state/todo2_model.dart';

// Firebaseを使うためのProvider
final firebaseProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

// TextEditingControllerを使うためのProvider
final textProvider = StateProvider.autoDispose((ref) {
  // riverpodで使うには、('')が必要
  return TextEditingController(text: '');
});

String changeCategory = '薬';

// TextEditingControllerを使うためのProvider
final categoryProvider = StateProvider /* <String> */ ((ref) {
  // riverpodで使うには、('')が必要
  return changeCategory;
});

// FireStoreの'memos'コレクションのすべてのドキュメントを取得するプロバイダー。初回に全件分、あとは変更があるたびStreamに通知される。
final firebaseMemosProvider = StreamProvider.autoDispose((_) {
  return FirebaseFirestore.instance.collection('memos').snapshots();
});

// // FireStoreの'memos'コレクションのすべてのドキュメントを取得するプロバイダー。初回に全件分、あとは変更があるたびStreamに通知される。
// final firebaseMemos2Provider = StreamProvider.autoDispose((_) {
//   return FirebaseFirestore.instance.collection('memos2').snapshots();
// });

// final usersStreamProvider = StreamProvider<List<Todo2>>((ref) {
final firebaseMemos2Provider = StreamProvider((ref) {
  final collection = FirebaseFirestore.instance.collection('memos2');
  // データ（Map型）を取得
  final stream = collection.snapshots().map(
        // CollectionのデータからUserクラスを生成する
        (e) => e.docs.map((e) => Todo2.fromJson(e.data())).toList(),
      );
  return stream;
});
