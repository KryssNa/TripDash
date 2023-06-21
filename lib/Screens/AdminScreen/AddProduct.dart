import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripdash/ViewModel/ProductViewModel.dart';
import 'package:tripdash/model/ProductModel.dart';
import '../../widget/textFieldWidget.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);
  static const routeName = '/AddProducts';

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController product_name = TextEditingController();
  TextEditingController product_category = TextEditingController();
  TextEditingController product_price = TextEditingController();
  TextEditingController product_offer = TextEditingController();
  int id = DateTime.now().millisecondsSinceEpoch;
  File? pickedImage;

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

  Future<void> add_product(ProductViewModel) async {
    if (_formKey.currentState!.validate()) {
      if (pickedImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select an image")),
        );
        return;
      }
      FirebaseFirestore db = FirebaseFirestore.instance;
      Reference storageRef = FirebaseStorage.instance.ref();

      String dt = DateTime.now().millisecondsSinceEpoch.toString();
      var photo = await storageRef.child("product").child("$dt.jpg").putFile(
          File(pickedImage!.path));
      var url = await photo.ref.getDownloadURL();

      final data = ProductModel(
        productId: id.toString(),
        productName: product_name.text,
        category: product_category.text,
        price: product_price.text,
        offer: product_offer.text,
        imageUrl: url,
        imagepath: photo.ref.fullPath,
      );
      db.collection("product").add(data.toJson()).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("product added")));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Add Product',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                child: ElevatedButton.icon(
                  onPressed: () => imagePickerOption(),
                  icon: const Icon(Icons.add_a_photo_sharp),
                  label: const Text('Product Image'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: product_name,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter a product name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.add_circle_outline,
                      color: Colors.black,
                    ),
                    hintText: "Product Name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: product_category,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Product Location is required";
                    }
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.category,
                      color: Colors.black,
                    ),
                    hintText: "Product Category",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
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
                      Icons.price_change_outlined,
                      color: Colors.black,
                    ),
                    hintText: "Price",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: product_offer,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Product offer is required";
                    }
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.local_offer_outlined,
                      color: Colors.black,
                    ),
                    hintText: "Offers",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    add_product(ProductViewModel);
                  },
                  icon: const Icon(Icons.location_city),
                  label: const Text('Add Product'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
