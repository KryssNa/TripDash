import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripdash/Screens/ViewPlaceScreen/place_screen.dart';
import 'package:tripdash/ViewModel/place_viewmodel.dart';
import 'package:tripdash/model/place_model.dart';


class AdminAddPlaces extends StatefulWidget {
  const  AdminAddPlaces ({super.key});
  static const routeName = '/PlaceAddPlace';

  @override
  State<AdminAddPlaces> createState() => _PlacePlace();
}

class _PlacePlace extends State<AdminAddPlaces> {
  TextEditingController placeName = TextEditingController();
  TextEditingController placeLocation = TextEditingController();
  TextEditingController placePrice = TextEditingController();
  TextEditingController placeDescription = TextEditingController();
  int id = DateTime.now().millisecondsSinceEpoch;
  File? pickedImage;
  // var uuid = Uuid();
  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
          child: Container(
            color: Colors.blue,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });
      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> addPlace(placeViewModels) async {
    if (pickedImage == null) {
      // ScaffoldMessenger.of(context).showSnackBar(snackBar)
      return;
    }
    FirebaseFirestore db = FirebaseFirestore.instance;
    Reference storageRef = FirebaseStorage.instance.ref();

    String dt = DateTime.now().millisecondsSinceEpoch.toString();
    var photo = await storageRef
        .child("places")
        .child("$dt.jpg")
        .putFile(File(pickedImage!.path));
    var url = await photo.ref.getDownloadURL();

    final data = PlaceModel(
        placeId: id.toString(),
        placeName: placeName.text,
        location: placeLocation.text,
        price: placePrice.text,
        description: placeDescription.text,
        imageUrl: url,
        imagepath: photo.ref.fullPath);
    db.collection("place").add(data.toJson()).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("place added")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Add Place',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            // fontFamily: 'SF-Pro',
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // border: Border.all(
                      //     color: Colors.grey.withOpacity(0.6), width: 2),
                    ),
                    child: ClipRect(
                      child: pickedImage != null
                          ? Image.file(
                        pickedImage!,
                        width: 500,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                          : Image.asset('Assets/images/insert_image.png'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                  onPressed: imagePickerOption,
                  icon: const Icon(Icons.add_a_photo_sharp),
                  label: const Text('Place Image')),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: placeName,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Place";
                  }
                  if (!RegExp(r"^[a-zA-Z]").hasMatch(value)) {
                    return "Please enter the place name";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.drive_file_rename_outline_sharp,
                    color: Colors.black,
                  ),
                  hintText: "Place Name",
                ),
              ),
            ),
            const SizedBox(
              height: 20,
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: placeLocation,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Place Location is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.place_sharp,
                    color: Colors.black,
                  ),
                  hintText: "Place Location",
                ),
              ),
            ),
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: placePrice,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "place price is needed";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.price_change_sharp,
                    color: Colors.black,
                  ),
                  hintText: "Place Price",
                ),
              ),
            ),
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: placeDescription,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Place description is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.description,
                    color: Colors.black,
                  ),
                  hintText: "Place description",
                ),
              ),
            ),
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                  onPressed: () {
                    addPlace(PlaceViewModel);
                    Navigator.pushReplacementNamed(
                        context, PlaceHomeScreen.routeName);
                  },
                  icon: const Icon(Icons.place_sharp),
                  label: const Text('Add Place')),
            ),
          ],
        ),
      ),
    );
  }
}