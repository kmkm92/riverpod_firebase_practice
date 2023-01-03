import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/ui/image_page/state/image_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

// TextEditingControllerを使うためのProvider
final titleProvider = StateProvider.autoDispose((ref) {
  // riverpodで使うには、('')が必要
  return TextEditingController(text: '');
});
// TextEditingControllerを使うためのProvider
final textProvider = StateProvider.autoDispose((ref) {
  // riverpodで使うには、('')が必要
  return TextEditingController(text: '');
});

final imageUrlProvider = StateProvider /* <String> */ ((ref) {
  return '';
});

// 一覧取得
final firebaseImageProvider = StreamProvider((ref) {
  final collection = FirebaseFirestore.instance.collection('image_test');
  // データ（Map型）を取得
  final stream = collection.snapshots().map(
        // CollectionのデータからUserクラスを生成する
        (e) => e.docs.map((e) => ImageModel.fromJson(e.data())).toList(),
      );
  return stream;
});

// 画像保存と画像アップロードの関数を扱うProvider
final imageStateProvider = StateNotifierProvider<ImageState, dynamic>((ref) {
  // Riverpod2.0はここの引数にrefを書かなければエラーになる!
  return ImageState(ref);
});

class ImageState extends StateNotifier<dynamic> {
  // Refを使うと他のファイルのProviderを呼び出せる
  final Ref _ref;
  // superは、親クラスのコンストクラスターを呼び出す
  ImageState(this._ref) : super([]);
  String imageUrl = '';
  Future imagePickAndUploadStorage() async {
    /*Step 1:Pick image*/
    //Install image_picker
    //Import the corresponding library

    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    print('${file?.path}');
    // print(file);

    if (file == null) return;
    //Import dart:core
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    /*Step 2: Upload to Firebase storage*/
    //Install firebase_storage
    //Import the library

    //Get a reference to storage root
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');

    //Create a reference for the image to be stored
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    //Handle errors/success
    try {
      //Store the file
      await referenceImageToUpload.putFile(File(file.path));
      //Success: get the download URL
      imageUrl = await referenceImageToUpload.getDownloadURL();
      _ref.watch(imageUrlProvider.notifier).state = imageUrl;
    } catch (error) {
      //Some error occurred
      String errorText;
      errorText = error.toString();
      print(errorText);
      return error;
    }
    // return imageUrl;
  }
}

// imageUrlProvider

final imageAddProvider = StateNotifierProvider<ImageAdd, dynamic>((ref) {
  // Riverpod2.0はここの引数にrefを書かなければエラーになる!
  return ImageAdd(ref);
});

class ImageAdd extends StateNotifier<dynamic> {
  // Refを使うと他のファイルのProviderを呼び出せる
  final Ref _ref;
  // superは、親クラスのコンストクラスターを呼び出す
  ImageAdd(this._ref) : super([]);
  Future imageAddFirestore(String title, String text, String imageUrl) async {
    final images = FirebaseFirestore.instance.collection('image_test').doc();
    // createdAtは、FireStoreに作成した時刻をTimestampで保存する
    images.set({
      'id': images.id,
      'title': title,
      'text': text,
      'image': imageUrl,
    });
  }
}
