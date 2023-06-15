import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../ViewModel/event_viewmodel.dart';
import '../../model/event_Model.dart';


class AdminAddEvents extends StatefulWidget {
  const  AdminAddEvents ({super.key});
  static const routeName = '/EventAddEvent';

  @override
  State< AdminAddEvents > createState() => _EventEvent ();
}

class  _EventEvent  extends State< AdminAddEvents > {
  TextEditingController event_title = TextEditingController();
  TextEditingController event_location = TextEditingController();
  TextEditingController event_category = TextEditingController();
  TextEditingController event_date = TextEditingController();
  TextEditingController event_description = new TextEditingController();
  int id = new DateTime.now().millisecondsSinceEpoch;
  File? pickedImage;

// DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
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
            color: Color.fromARGB(255, 190, 216, 238),
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
                    icon: const Icon(Icons.camera_alt_rounded),
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
                    icon: const Icon(
                      Icons.cancel_outlined,
                       color: Color.fromARGB(255, 231, 91, 81),
                    ),
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
 
  Future<void> add_event(EventViewModel) async {
    if(pickedImage == null){
      return;
    }
    FirebaseFirestore db = FirebaseFirestore.instance;
    Reference storageRef = FirebaseStorage.instance.ref();

    String dt = DateTime.now().millisecondsSinceEpoch.toString();
    var photo = await storageRef.child("events").child("$dt.jpg").putFile(File(pickedImage!.path));
    var url = await photo.ref.getDownloadURL();

    final data = EventModel (
        eventId: id.toString(),
        title:event_title.text,
        location: event_location.text,
        category:event_category.text,
        date: event_date.text,
        description: event_description.text,
        imageUrl: url,
        imagepath: photo.ref.fullPath
    );
    db.collection("event").add(data.toJson()).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        Fluttertoast.showToast(
          msg: "Event Added Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Color.fromARGB(255, 23, 217, 68),
          textColor: Colors.white,
        )as SnackBar
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  'Add Event',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: event_title,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Event Title is required";
                      }
                      if (!RegExp(r"^[a-zA-Z]").hasMatch(value)) {
                        return "Please enter a valid Event Title";
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      suffixIcon: Icon(
                        Icons.title,
                        color: Colors.black,
                      ),
                      hintText: "Event Title",
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Color.fromARGB(255, 219, 168, 168),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Event Category',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: event_category,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Event Catorogy is required";
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      suffixIcon: Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),
                      hintText: "Event Catorogy",
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Color.fromARGB(255, 219, 168, 168),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: event_location,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Event Location is required";
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      suffixIcon: Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),
                      hintText: "Event Location",
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Color.fromARGB(255, 219, 168, 168),
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: event_date,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Event Date is needed";
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        color: Colors.black,
                      ),
                      hintText: "yyyy/mm/dd",
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Color.fromARGB(255, 219, 168, 168),
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    ),
                    readOnly: true,
                    onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101)
                  );
                  if(pickedDate != null ){
                      print(pickedDate); 
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                      print(formattedDate); 
                      setState(() {
                         event_date.text = formattedDate;
                      });
                      }
                    }
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Image',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                  onPressed: imagePickerOption,
                  icon: const Icon(Icons.add_a_photo_sharp),
                  label: const Text('Event Image')),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    controller: event_description,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Description is required";
                      }
                    },
                    minLines: 1,
                    maxLines: null,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Icon(
                        Icons.description,
                        color: Colors.black,
                      ),
                      hintText: "Event Description",
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Color.fromARGB(255, 219, 168, 168),
                      contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0), // Adjust the padding as needed
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                  onPressed: () {
                    add_event(EventViewModel);
                  },
                  icon: const Icon(Icons.event_available_rounded),
                  label: const Text('Add Event')),
            ),
          ],
        ),
      ),
    );
  }
}