import 'package:riverpod_firebase_practice/ui/todo_page/pages/add_page.dart';
import 'package:riverpod_firebase_practice/ui/todo_page/pages/read_page.dart';
import 'package:riverpod_firebase_practice/ui/todo2_page/pages/add2_page.dart';
import 'package:riverpod_firebase_practice/ui/todo2_page/pages/read2_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          // （2） 実際に表示するページ(ウィジェット)を指定する
                          builder: (context) => ReadPage()));
                },
                child: Text('todoデータを表示')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          // （2） 実際に表示するページ(ウィジェット)を指定する
                          builder: (context) => AddPage()));
                },
                child: Text('todoデータを追加')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          // （2） 実際に表示するページ(ウィジェット)を指定する
                          builder: (context) => ReadPage2()));
                },
                child: Text('todo2データを表示')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          // （2） 実際に表示するページ(ウィジェット)を指定する
                          builder: (context) => AddPage2()));
                },
                child: Text('todo2データを追加')),
          ],
        ),
      ),
    );
  }
}
