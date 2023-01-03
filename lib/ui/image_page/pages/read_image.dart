import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firebase_practice/ui/image_page/state/image_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemList extends ConsumerWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseImages = ref.watch(firebaseImageProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
      ),
      body: SafeArea(
        child: firebaseImages.when(
          data: (firebaseImages) {
            return GridView.builder(
              itemCount: firebaseImages.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                // print(firebaseImages[index].title);
                return GestureDetector(
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 120,
                          width: double.infinity,
                          child: Container(
                            color: Colors.grey,
                            child: Center(
                              child: firebaseImages[index]
                                      .image
                                      .contains('image')
                                  ? Image.network(firebaseImages[index].image)
                                  : Container(
                                      child: Text(firebaseImages[index].image),
                                    ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            firebaseImages[index].title,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(firebaseImages[index].text),
                            // Text(' ~ '),
                            // Text('2022/11/30'),
                          ],
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => BottomNavigation(
                    //       title: itineraryList[index],
                    //     ),
                    //     // fullscreenDialog: true,
                    //   ),
                    // );
                  },
                );
              },
            );
          },

          // データの読み込み中（FireStoreではあまり発生しない）
          loading: () {
            return const Text('Loading');
          },

          // エラー（例外発生）時
          error: (e, stackTrace) {
            return Text('error: $e');
          },
        ),
      ),
    );
  }
}

// class ItemList extends StatelessWidget {
//   // ItemList({Key? key}) : super(key: key) {
//   //   _stream = _reference.snapshots();
//   // }

//   CollectionReference _reference =
//       FirebaseFirestore.instance.collection('shopping_list');

//   //_reference.get()  ---> returns Future<QuerySnapshot>
//   //_reference.snapshots()--> Stream<QuerySnapshot> -- realtime updates
//   late Stream<QuerySnapshot> _stream;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Items'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _stream,
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           //Check error
//           if (snapshot.hasError) {
//             return Center(child: Text('Some error occurred ${snapshot.error}'));
//           }

//           //Check if data arrived
//           if (snapshot.hasData) {
//             //get the data
//             QuerySnapshot querySnapshot = snapshot.data;
//             List<QueryDocumentSnapshot> documents = querySnapshot.docs;

//             //Convert the documents to Maps
//             List<Map> items = documents.map((e) => e.data() as Map).toList();

//             //Display the list
//             return ListView.builder(
//                 itemCount: items.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   //Get the item at this index
//                   Map thisItem = items[index];
//                   //REturn the widget for the list items
//                   return ListTile(
//                     title: Text('${thisItem['name']}'),
//                     subtitle: Text('${thisItem['quantity']}'),
//                     leading: Container(
//                       height: 80,
//                       width: 80,
//                       child: thisItem.containsKey('image')
//                           ? Image.network('${thisItem['image']}')
//                           : Container(),
//                     ),
//                   );
//                 });
//           }

//           //Show loader
//           return Center(child: CircularProgressIndicator());
//         },
//       ), //Display a list // Add a FutureBuilder
//     );
//   }
// }
