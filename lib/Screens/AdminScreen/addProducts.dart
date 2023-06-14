import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripdash/ViewModel/product_view_model.dart';
import 'package:tripdash/model/Product_Model.dart';



class AddProduct extends StatefulWidget {
  const  AddProduct ({super.key});
  static const routeName = '/AddPRoducts';
  @override
  State< AddProduct > createState() => _AddProductState ();
}

class  _AddProductState  extends State< AddProduct > {
  TextEditingController product_name = TextEditingController();
  TextEditingController product_location = TextEditingController();
  TextEditingController product_price = TextEditingController();
  TextEditingController product_description = new TextEditingController();
  int product_id = new DateTime.now().millisecondsSinceEpoch;
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

  Future<void> add_hotel(ProductModel) async {
    if(pickedImage == null){
      // ScaffoldMessenger.of(context).showSnackBar(snackBar)
      return;
    }
    FirebaseFirestore db = FirebaseFirestore.instance;
    Reference storageRef = FirebaseStorage.instance.ref();

    String dt = DateTime.now().millisecondsSinceEpoch.toString();
    var photo = await storageRef.child("product").child("$dt.jpg").putFile(File(pickedImage!.path));
    var url = await photo.ref.getDownloadURL();

    final data = ProductModel(
        hotelId: product_id.toString(),
        hotelName:product_name.text,
        location: product_location.text,
        price: product_price.text,
        description: product_description.text,
        imageUrl: url,
        imagepath: photo.ref.fullPath
    );
    db.collection("prduct").add(data.toJson()).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("product added")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Add Product',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            // fontFamily: 'SF-Pro',
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
                      child: pickedImage != null ? Image.file(
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0,vertical:4.0),
              child: ElevatedButton.icon(
                  onPressed: ()=>imagePickerOption(),
                  icon: const Icon(Icons.add_a_photo_sharp),
                  label: const Text('Product Image')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 4.0),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                controller: product_name,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Place";
                  }
                  if (!RegExp(r"^[a-zA-Z]").hasMatch(value)) {
                    return "Please enter the product name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.place_sharp,
                    color: Colors.black,
                  ),
                  hintText: "Product Name",
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 4.0),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                controller: product_location,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Product Location is required";
                  }
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.location_city,
                    color: Colors.black,
                  ),
                  hintText: "Product Location",
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 4.0),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                controller: product_price,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Product price is needed";
                  }
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.price_change,
                    color: const Color.fromARGB(255, 151, 135, 135),
                  ),
                  hintText: "Product Price",
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 4.0),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                controller: product_description,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Product description is required";
                  }
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.description,
                    color: Colors.black,
                  ),
                  hintText: "Product description",
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 4.0),
              child: ElevatedButton.icon(
                  onPressed: () {
                    add_hotel(ProductViewModel);
                  },
                  icon: const Icon(Icons.location_city),
                  label: const Text('Add Product')),
            ),
          ],
        ),
      ),
    );
  }
}