import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripdash/ViewModel/hotel_viewmodel.dart';
import 'package:tripdash/model/hotel_model.dart';



class AdminAddHotels extends StatefulWidget {
  const  AdminAddHotels ({super.key});
  static const routeName = '/HotelAddPlace';
  @override
  State< AdminAddHotels > createState() => _HotelPlace ();
}

class  _HotelPlace  extends State< AdminAddHotels > {
  TextEditingController hotelName = TextEditingController();
  TextEditingController hotelLocation = TextEditingController();
  TextEditingController hotelPrice = TextEditingController();
  TextEditingController hotelDescription = TextEditingController();
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

  Future<void> addHotel(hotelViewModel) async {
    if(pickedImage == null){
      // ScaffoldMessenger.of(context).showSnackBar(snackBar)
      return;
    }
    FirebaseFirestore db = FirebaseFirestore.instance;
    Reference storageRef = FirebaseStorage.instance.ref();

    String dt = DateTime.now().millisecondsSinceEpoch.toString();
    var photo = await storageRef.child("hotels").child("$dt.jpg").putFile(File(pickedImage!.path));
    var url = await photo.ref.getDownloadURL();

    final data = HotelModel(
        hotelId: id.toString(),
        hotelName:hotelName.text,
        location: hotelLocation.text,
        price: hotelPrice.text,
        description: hotelDescription.text,
        imageUrl: url,
        imagepath: photo.ref.fullPath
    );
    db.collection("hotel").add(data.toJson()).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("hotel added")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
        title: const Text('Add Hotel',
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
                  label: const Text('Hotel Image')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 4.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: hotelName,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Place";
                  }
                  if (!RegExp(r"^[a-zA-Z]").hasMatch(value)) {
                    return "Please enter the hotel name";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.place_sharp,
                    color: Colors.black,
                  ),
                  hintText: "Hotel Name",
                ),
              ),
            ),
           
         
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 4.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: hotelLocation,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Hotel Location is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.location_city,
                    color: Colors.black,
                  ),
                  hintText: "Hotel Location",
                ),
              ),
            ),
          
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 4.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: hotelPrice,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Hotel price is needed";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.price_change,
                    color: Color.fromARGB(255, 151, 135, 135),
                  ),
                  hintText: "Hotel Price",
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 4.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: hotelDescription,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Hotel description is required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.description,
                    color: Colors.black,
                  ),
                  hintText: "Hotel description",
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 4.0),
              child: ElevatedButton.icon(
                  onPressed: () {
                    addHotel(HotelViewModel);
                  },
                  icon: const Icon(Icons.location_city),
                  label: const Text('Add Hotel')),
            ),
          ],
        ),
      ),
    );
  }
}