import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firebase_practice/ui/auth_page/state/auth_state.dart';

class Register extends ConsumerWidget {
  const Register({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(newNameProvider);
    final email = ref.watch(newEmailProvider);
    final password = ref.watch(newPasswordProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: name,
              decoration: const InputDecoration(
                hintText: '名前を入力',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: email,
              decoration: const InputDecoration(
                hintText: 'メールアドレスを入力',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'パスワードを入力',
              ),
            ),
          ),
          ElevatedButton(
            child: const Text('新規登録'),
            //ステップ２
            onPressed: () async {
              ref
                  .read(registerProvider.notifier)
                  .registerUser(name.text, email.text, password.text, context);
              // try {
              //   final newUser = await _auth.createUserWithEmailAndPassword(
              //       email: email, password: password);
              //   if (newUser != null) {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => MainContent()));
              //   }
              // } on FirebaseAuthException catch (e) {
              //   if (e.code == 'email-already-in-use') {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: Text('指定したメールアドレスは登録済みです'),
              //       ),
              //     );
              //     print('指定したメールアドレスは登録済みです');
              //   } else if (e.code == 'invalid-email') {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: Text('メールアドレスのフォーマットが正しくありません'),
              //       ),
              //     );
              //     print('メールアドレスのフォーマットが正しくありません');
              //   } else if (e.code == 'operation-not-allowed') {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: Text('指定したメールアドレス・パスワードは現在使用できません'),
              //       ),
              //     );
              //     print('指定したメールアドレス・パスワードは現在使用できません');
              //   } else if (e.code == 'weak-password') {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: Text('パスワードは６文字以上にしてください'),
              //       ),
              //     );
              //     print('パスワードは６文字以上にしてください');
              //   }
              // }
            },
          )
        ],
      ),
    );
  }
}
