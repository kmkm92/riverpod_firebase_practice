import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_firebase_practice/ui/todo2_page/state/todo2_state.dart';
import '/../../utils/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grouped_list/grouped_list.dart';

class ReadPage2 extends ConsumerWidget {
  const ReadPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final /* AsyncValue<QuerySnapshot>  */ firebaseMemos =
        ref.watch(firebaseMemos2Provider);
    // textProviderを呼び出す定数を定義
    // final controllerProvider = ref.watch(textProvider);
    // final listProvider = ref.watch(appStateProviderList);
    // print(firebaseMemos);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Read'),
      ),
      body: SafeArea(
          child: firebaseMemos.when(
        // データがあった（データはqueryの中にある）
        data: (firebaseMemos) {
          // post内のドキュメントをリストで表示する
          return GroupedListView(
            elements: firebaseMemos,
            // groupBy: (item) {
            //   print(item);

            //   var todoList = listProvider[item];
            //   print(todoList);
            //   print(todoList.category);
            //   return todoList.category;
            // },
            // groupBy: (item) => listProvider[item].category,
            groupBy: (item) => item.category,
            groupSeparatorBuilder: (groupValue) => Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Text(
                          groupValue,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.blue,
                      ))
                    ],
                  ))
                ],
              ),
            ),
            itemBuilder: (context, item) {
              // Todo2 todoList = listProvider[item];
              // print(item);
              return Card(
                elevation: 3.0,
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                child: CheckboxListTile(
                  activeColor: Colors.blue,
                  title: Text(item.text),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: false,
                  onChanged: (e) {},
                ),
              );
            },
            groupComparator: (group1, group2) => group1.compareTo(group2),
            itemComparator: (item1, item2) =>
                item1.category.compareTo(item2.category),
            useStickyGroupSeparators: true,
            floatingHeader: false,
            order: GroupedListOrder.DESC,
          );

          /* ListView.builder(
            itemCount: listProvider.length,
            itemBuilder: (BuildContext context, int item) {
              Todo2 todoList = listProvider[item];
              print(listProvider);
              return Container(
                child: ListTile(
                  subtitle: Text('カテゴリー: ${todoList.category}'),
                  title: Text('テキスト: ${todoList.text}'),
                ),
              );
            },
          ); */
        },

        // データの読み込み中（FireStoreではあまり発生しない）
        loading: () {
          return const Text('Loading');
        },

        // エラー（例外発生）時
        error: (e, stackTrace) {
          return Text('error: $e');
        },
      )),
    );
  }
}
