import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firebase_practice/ui/auth_page/pages/signin_page.dart';

import '../state/auth_state.dart';

class UserLogin extends ConsumerWidget {
  const UserLogin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
      ),
      body: Column(
        children: [
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
            child: const Text('ログイン'),
            onPressed: () async {
              ref
                  .read(loginProvider.notifier)
                  .loginUser(email.text, password.text, context);
              // try {
              //   final newUser = await _auth.signInWithEmailAndPassword(
              //       email: email, password: password);
              //   if (newUser != null) {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => MainContent()));
              //   }
              // } on FirebaseAuthException catch (e) {
              //   if (e.code == 'invalid-email') {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: Text(''),
              //       ),
              //     );
              //     print('メールアドレスのフォーマットが正しくありません');
              //   } else if (e.code == 'user-disabled') {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: Text('現在指定したメールアドレスは使用できません'),
              //       ),
              //     );
              //     print('現在指定したメールアドレスは使用できません');
              //   } else if (e.code == 'user-not-found') {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: Text('指定したメールアドレスは登録されていません'),
              //       ),
              //     );
              //     print('指定したメールアドレスは登録されていません');
              //   } else if (e.code == 'wrong-password') {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: Text('パスワードが間違っています'),
              //       ),
              //     );
              //     print('パスワードが間違っています');
              //   }
              // }
            },
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register()));
              },
              child: Text('新規登録はこちらから'))
        ],
      ),
    );
  }
}
