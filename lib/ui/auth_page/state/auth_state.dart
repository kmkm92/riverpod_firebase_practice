import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firebase_practice/ui/auth_page/pages/signin_page.dart';
import 'package:riverpod_firebase_practice/ui/home_page.dart';

final newNameProvider = StateProvider.autoDispose((ref) {
  return TextEditingController();
});

final newEmailProvider = StateProvider.autoDispose((ref) {
  return TextEditingController();
});

final newPasswordProvider = StateProvider.autoDispose((ref) {
  return TextEditingController();
});

final registerProvider = StateNotifierProvider<RegisterState, dynamic>((ref) {
  return RegisterState(ref);
});

class RegisterState extends StateNotifier<dynamic> {
  // Refを使うと他のファイルのProviderを呼び出せる
  final Ref _ref;
  // superは、親クラスのコンストクラスターを呼び出す
  RegisterState(this._ref) : super([]);

  Future registerUser(
      String name, String email, String password, BuildContext context) async {
    try {
      // print('ready');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((currentUser) => FirebaseFirestore.instance
                  .collection("users")
                  .doc(currentUser.user?.uid)
                  .set({
                "uid": currentUser.user?.uid,
                "name": name,
                "email": email,
              }))
          .then((result) => {
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  )
                }
              });

      // if (newUser) {

      // }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('指定したメールアドレスは登録済みです'),
          ),
        );
        print('指定したメールアドレスは登録済みです');
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('メールアドレスのフォーマットが正しくありません'),
          ),
        );
        print('メールアドレスのフォーマットが正しくありません');
      } else if (e.code == 'operation-not-allowed') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('指定したメールアドレス・パスワードは現在使用できません'),
          ),
        );
        print('指定したメールアドレス・パスワードは現在使用できません');
      } else if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('パスワードは６文字以上にしてください'),
          ),
        );
        print('パスワードは６文字以上にしてください');
      }
    }
  }
}

final emailProvider = StateProvider.autoDispose((ref) {
  return TextEditingController();
});

final passwordProvider = StateProvider.autoDispose((ref) {
  return TextEditingController();
});

final loginProvider = StateNotifierProvider<LoginState, dynamic>((ref) {
  return LoginState(ref);
});

class LoginState extends StateNotifier<dynamic> {
  // Refを使うと他のファイルのProviderを呼び出せる
  final Ref _ref;
  // superは、親クラスのコンストクラスターを呼び出す
  LoginState(this._ref) : super([]);

  Future loginUser(String email, String password, BuildContext context) async {
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // .then((currentUser) => FirebaseFirestore.instance
      //     //  test@test.jp
      //     .collection("users")
      //     .doc(currentUser.user?.uid)
      //     .get()
      //     .then((DocumentSnapshot result) => Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => HomePage(
      //                 // uid: currentUser.user.uid,
      //                 )))));
      // if (newUser != null) {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => MainContent()));
      // }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(''),
          ),
        );
        print('メールアドレスのフォーマットが正しくありません');
      } else if (e.code == 'user-disabled') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('現在指定したメールアドレスは使用できません'),
          ),
        );
        print('現在指定したメールアドレスは使用できません');
      } else if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('指定したメールアドレスは登録されていません'),
          ),
        );
        print('指定したメールアドレスは登録されていません');
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('パスワードが間違っています'),
          ),
        );
        print('パスワードが間違っています');
      }
    }
  }
}
