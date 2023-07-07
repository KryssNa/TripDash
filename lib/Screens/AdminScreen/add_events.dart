import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tripdash/ViewModel/event_viewmodel.dart';
import 'package:tripdash/model/event_model.dart';

class AdminAddEvents extends StatefulWidget {
  const  AdminAddEvents ({super.key});
  static const routeName = '/EventAddEvent';

  @override
  State< AdminAddEvents > createState() => _EventEvent ();
}

class  _EventEvent  extends State< AdminAddEvents > {
  TextEditingController eventTitle = TextEditingController();
  TextEditingController eventLocation = TextEditingController();
  TextEditingController eventCategory = TextEditingController();
  TextEditingController eventDate = TextEditingController();
  TextEditingController eventPrice = TextEditingController();
  TextEditingController eventDescription = TextEditingController();
  int id = DateTime.now().millisecondsSinceEpoch;
  File? pickedImage;
  final _formKey = GlobalKey<FormState>();

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
          child: Container(
            color: const Color.fromARGB(255, 190, 216, 238),
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
 
  Future<void> addEvent(eventViewModel) async {
    if(_formKey.currentState!.validate())
    {if (pickedImage == null){
        ScaffoldMessenger.of(context).showSnackBar(
          Fluttertoast.showToast(
            msg: "Event Image is not Provided",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            backgroundColor: const Color.fromARGB(255, 231, 4, 4),
            textColor: Colors.white,
          ) as SnackBar
        );
        return;
    }
    FirebaseFirestore db = FirebaseFirestore.instance;
    Reference storageRef = FirebaseStorage.instance.ref();

    String dt = DateTime.now().millisecondsSinceEpoch.toString();
    var photo = await storageRef.child("events").child("$dt.jpg").putFile(File(pickedImage!.path));
    var url = await photo.ref.getDownloadURL();

    final data = EventModel (
        eventId: id.toString(),
        title:eventTitle.text,
        location: eventLocation.text,
        category:eventCategory.text,
        date: DateTime.parse(eventDate.text),
        price: eventPrice.text,
        description: eventDescription.text,
        imageUrl: url,
        imagepath: photo.ref.fullPath
    );
    db.collection("event").add(data.toJson()).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
      Fluttertoast.showToast(
        msg: "Event Added Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: const Color.fromARGB(255, 16, 176, 45),
        textColor: Colors.white,
      ) as SnackBar
      );
    });
    }
  }
  void showAlert(){
    showDialog(context: context,
     builder: (context){
      return AlertDialog(
        backgroundColor: Colors.green,
        actions: [
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
          MaterialButton(
            onPressed: (){
              addEvent(EventViewModel);
              Navigator.pop(context);
            },
            color: Colors.blue, // Customize the button background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Customize the button shape
            ),
            child: const Text("Add more Events"),
          ),
          MaterialButton(
            onPressed: (){
              Navigator.pop(context);
            },
            color: Colors.blue, // Customize the button background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Customize the button shape
            ),
            child: const Text("Done"),
          ),
        ],
        ),
        ],
      );
     }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:Form(
            key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
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
                        const Text(
                          'Title',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.black),
                          controller: eventTitle,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Event Title is required";
                            }
                            if (!RegExp(r"^[a-zA-Z]").hasMatch(value)) {
                              return "Please enter a valid Event Title";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            suffixIcon: const Icon(
                              Icons.title,
                              color: Colors.black,
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 219, 168, 168),
                            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Event Category',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.black),
                          controller: eventCategory,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Event Catorogy is required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            suffixIcon: const Icon(
                              Icons.location_on,
                              color: Colors.black,
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 219, 168, 168),
                            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
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
                        const Text(
                          'Price',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.black),
                          controller: eventPrice,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Event Price is required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            suffixIcon: const Icon(
                              Icons.price_change,
                              color: Colors.black,
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 219, 168, 168),
                            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
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
                        const Text(
                          'Location',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.black),
                          controller: eventLocation,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Event Location is required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            suffixIcon: const Icon(
                              Icons.location_on,
                              color: Colors.black,
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 219, 168, 168),
                            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
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
                        const Text(
                          'Date',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.black),
                          controller: eventDate,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Event Date is needed";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            suffixIcon: const Icon(
                              Icons.calendar_month,
                              color: Colors.black,
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 219, 168, 168),
                            contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                          ),
                          readOnly: true,
                          onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context, initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101)
                        );
                        if(pickedDate != null ){
                            if (kDebugMode) {
                              print(pickedDate);
                            }
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                            if (kDebugMode) {
                              print(formattedDate);
                            }
                            setState(() {
                               eventDate.text = formattedDate;
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
                        const Text(
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
                        const Text(
                          'Description',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.black),
                          controller: eventDescription,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Description is required";
                            }
                            return null;
                          },
                          minLines: 1,
                          maxLines: null,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            prefixIcon: const Icon(
                              Icons.description,
                              color: Colors.black,
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 219, 168, 168),
                            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0), // Adjust the padding as needed
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                        onPressed:() {
                          addEvent(EventViewModel);

                        },
                        icon: const Icon(Icons.event_available_rounded),
                        label: const Text('Add Event')),
                  ),
                ],
              ),
            ),

        ),
      ),
    );
  }
}