import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'read_image.dart';
import 'package:riverpod_firebase_practice/ui/image_page/state/image_state.dart';

class AddItem extends ConsumerWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleEditController = ref.watch(titleProvider);
    final textEditController = ref.watch(textProvider);
    final imageStateController = ref.watch(imageStateProvider);
    final imageAddController = ref.watch(imageAddProvider);
    Future<dynamic> imageUrl;
    // String imageUrl = '';
    GlobalKey<FormState> key = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add an item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: titleEditController,
                decoration:
                    InputDecoration(hintText: 'Enter the name of the item'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item name';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: textEditController,
                decoration:
                    InputDecoration(hintText: 'Enter the quantity of the item'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item quantity';
                  }

                  return null;
                },
              ),
              IconButton(
                  onPressed: () async {
                    /*
                * Step 1. Pick/Capture an image   (image_picker)
                * Step 2. Upload the image to Firebase storage
                * Step 3. Get the URL of the uploaded image
                * Step 4. Store the image URL inside the corresponding
                *         document of the database.
                * Step 5. Display the image on the list
                *
                * */
                    // if (!imageStateController) {
                    //   Error err = imageStateController;
                    //   return err;
                    // }
                    // print(imageStateController.toString());
                    ref
                        .read(imageStateProvider.notifier)
                        .imagePickAndUploadStorage();

                    // /*Step 1:Pick image*/
                    // //Install image_picker
                    // //Import the corresponding library

                    // ImagePicker imagePicker = ImagePicker();
                    // XFile? file =
                    //     await imagePicker.pickImage(source: ImageSource.camera);
                    // print('${file?.path}');

                    // if (file == null) return;
                    // //Import dart:core
                    // String uniqueFileName =
                    //     DateTime.now().millisecondsSinceEpoch.toString();

                    // /*Step 2: Upload to Firebase storage*/
                    // //Install firebase_storage
                    // //Import the library

                    // //Get a reference to storage root
                    // Reference referenceRoot = FirebaseStorage.instance.ref();
                    // Reference referenceDirImages =
                    //     referenceRoot.child('images');

                    // //Create a reference for the image to be stored
                    // Reference referenceImageToUpload =
                    //     referenceDirImages.child('name');

                    // //Handle errors/success
                    // try {
                    //   //Store the file
                    //   await referenceImageToUpload.putFile(File(file!.path));
                    //   //Success: get the download URL
                    //   imageUrl = await referenceImageToUpload.getDownloadURL();
                    // } catch (error) {
                    //   //Some error occurred
                    // }
                  },
                  icon: Icon(Icons.camera_alt)),
              ElevatedButton(
                  onPressed: () async {
                    print(ref.watch(imageUrlProvider));
                    // if (imageUrl.isEmpty) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text('Please upload an image')));

                    //   return;
                    // }

                    if (key.currentState!.validate()) {
                      String itemTitle = titleEditController.text;
                      String itemText = textEditController.text;

                      ref.read(imageAddProvider.notifier).imageAddFirestore(
                          itemTitle, itemText, ref.watch(imageUrlProvider));
                    }
                    ;
                  },
                  child: Text('保存')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ItemList()));
                  },
                  child: Text('ListPage'))
            ],
          ),
        ),
      ),
    );
  }
}
