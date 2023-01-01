import 'package:riverpod_firebase_practice/ui/todo2_page/state/todo2_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/../../utils/firebase_provider.dart';

class AddPage2 extends ConsumerWidget {
  const AddPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // textProviderを呼び出す定数を定義
    final controllerProvider = ref.watch(textProvider);
    final controllerProviderCategory = ref.watch(categoryProvider);
    String isSelectedValue = '';
    // print(controllerProviderCategory);
    // String setState(value) {
    //   controllerProviderCategory = value;
    //   return controllerProviderCategory;
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add2'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                items: [
                  DropdownMenuItem(
                    child: Text('必需品'),
                    value: '必需品',
                  ),
                  DropdownMenuItem(
                    child: Text('衣類'),
                    value: '衣類',
                  ),
                  DropdownMenuItem(
                    child: Text('貴重品'),
                    value: '貴重品',
                  ),
                  DropdownMenuItem(
                    child: Text('薬'),
                    value: '薬',
                  ),
                  DropdownMenuItem(
                    child: Text('その他'),
                    value: 'その他',
                  ),
                ],
                value: controllerProviderCategory,
                onChanged: (value) {
                  // setState(value);
                  ref.watch(categoryProvider.notifier).state = value!;
                  // print(controllerProviderCategory);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: controllerProvider, //providerに定義したコントローラーを使う
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: '文字を入力してください',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    // ref.readでStateNotifierを呼び出す.
                    // controllerProvider.textと書いて
                    ref.read(appStateProvider2.notifier).textAdd(
                        controllerProviderCategory, controllerProvider.text);
                    print(controllerProviderCategory +
                        ':' +
                        controllerProvider.text);
                  },
                  child: Text('新規登録')),
            ],
          ),
        ),
      ),
    );
  }
}
