import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firebase_practice/ui/todo2_page/pages/add2_page.dart';
import 'todo2_model.dart';

import '/utils/firebase_provider.dart';

// 外部からStateNotifierを呼び出せるようになるProvider
final appStateProvider2 = StateNotifierProvider<AppState2, dynamic>((ref) {
  // Riverpod2.0はここの引数にrefを書かなければエラーになる!
  return AppState2(ref);
});

class AppState2 extends StateNotifier<dynamic> {
  // Refを使うと他のファイルのProviderを呼び出せる
  final Ref _ref;
  // superは、親クラスのコンストクラスターを呼び出す
  AppState2(this._ref) : super([]);
  // FireStoreにデータを追加するメソッド
  Future<void> textAdd(String category, String text) async {
    // _ref.read()と書いて、firebaseProviderを呼び出す
    final memos2 = _ref.read(firebaseProvider).collection('memos2').doc();
    // createdAtは、FireStoreに作成した時刻をTimestampで保存する
    memos2.set({
      'id': memos2.id,
      'category': category,
      'text': text,
      'createdAt': Timestamp.fromDate(DateTime.now())
    });
  }

//   // FireStoreのデータを編集するメソッド
//   // Future<void> textUpdate(dynamic document, String text) async {
//   //   await FirebaseFirestore.instance
//   //       .collection('memos2')
//   //       .doc(document.id)
//   //       .update({'text': text});
//   // }

  // FireStoreのデータを削除するメソッド
  Future<void> deleteMemo(String id) async {
    await FirebaseFirestore.instance.collection('memos2').doc(id).delete();
  }
}

// リストの中身などを定義
// class Todo2 {
//   String category;
//   Timestamp createdAt;
//   String text;

//   Todo2({required this.category, required this.createdAt, required this.text});

//   // List<Todo2> todo2 = [];

//   // factoryを利用する場合、インスタンスは処理内で作成して返却する必要がある
//   // 今回は引数(Firestoreの情報)からインスタンスを生成する
//   // また引数については、処理内で再設定されないようfinalを追記
//   factory Todo2.toModel(final Map<String, dynamic> data) {
//     //　ここでインスタンスを生成し返却する
//     return Todo2(
//         category: data['category'],
//         createdAt: data['createdAt'],
//         text: data['text']);
//   }
//   // toJsonメソッドは
//   // 呼び出されるインスタンスの各フィールド値をMap形式に変換します
//   Map<String, Object?> toJson() {
//     return {'category': category, 'createdAt': createdAt, 'text': text};
//   }
// }

// // 外部からStateNotifierを呼び出せるようになるProvider
// final appStateProviderList =
//     StateNotifierProvider<TodoStore, List<Todo2>>((ref) {
//   return TodoStore();
// });

// class TodoStore extends StateNotifier<List<Todo2>> {
//   // List<Todo2> todo2 = [];
//   TodoStore() : super([]) {
//     // これは初期化処理１度だけ実行されます
//     // ここでFirestoreの情報を取得
//     debugPrint('init call📞');
//     _readFirebaseDocument();
//   }

//   // Firebaseの読み込みを行う関数
//   // 対象DocumentはBooks
//   Future<void> _readFirebaseDocument() async {
//     // まずはFirebaseを利用するためにinstanceを取得
//     // 以降設定することがないのでfinalで定義
//     // final store = FirebaseFirestore.instance;
//     // List<Todo2> todo2 = [];
//     final document = await FirebaseFirestore.instance
//         .collection('memos2')
//         .withConverter<Todo2>(
//           fromFirestore: (snapshot, _) => Todo2.toModel(snapshot.data()!),
//           toFirestore: (book, _) => book.toJson(),
//         )
//         .get();
//     // 取得したDocument情報からTodo情報を取得して
//     // stateに設定する
//     // document.docs.map((bookData) => todoData.data()).toList()
//     // ではdocument.docsの中身をtodoDataで受けて
//     // bookData.data()でBook.toModelを実行した結果にアクセスする
//     // その戻り値を.toList()でList形式に変換する
//     final List<Todo2> list =
//         document.docs.map((bookData) => bookData.data()).toList();
//     state = list; // mapで変換したデータが入った変数
//     // print(state);
//   }
// }

// final appStateProviderStreamList = StreamProvider.autoDispose((ref) {
//   Future<void> _readFirebaseDocument() async {
//     // まずはFirebaseを利用するためにinstanceを取得
//     // 以降設定することがないのでfinalで定義
//     // final store = FirebaseFirestore.instance;
//     final document = await FirebaseFirestore.instance
//         .collection('memos2')
//         .withConverter<Todo2>(
//           fromFirestore: (snapshot, _) => Todo2.toModel(snapshot.data()!),
//           toFirestore: (book, _) => book.toJson(),
//         )
//         .get();
//     // 取得したDocument情報からTodo情報を取得して
//     // stateに設定する
//     // document.docs.map((bookData) => todoData.data()).toList()
//     // ではdocument.docsの中身をtodoDataで受けて
//     // bookData.data()でBook.toModelを実行した結果にアクセスする
//     // その戻り値を.toList()でList形式に変換する
//     final List<Todo2> list =
//         document.docs.map((bookData) => bookData.data()).toList();
//     var state = list; // mapで変換したデータが入った変数
//     // print(state);
//   }

//   return FirebaseFirestore.instance
//       .collection('memos2')
//       .withConverter<Todo2>(
//         fromFirestore: (snapshot, _) => Todo2.toModel(snapshot.data()!),
//         toFirestore: (book, _) => book.toJson(),
//       )
//       .snapshots();
// });
