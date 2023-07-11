import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripdash/Repositeries/user_repositeries.dart';
import 'package:tripdash/Screens/TransportationScreen/Widgets/custom_button.dart';
import 'package:tripdash/constant/colors.dart';
import 'package:tripdash/constant/fonts.dart';
import 'package:tripdash/model/payment_model.dart';
import 'package:tripdash/model/user_model.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});
  static String routeName = "/PaymentScreen";

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int id = DateTime.now().millisecondsSinceEpoch;
  String? userId ;
  File? pickedImage;
  String? userName;
  String? transId;
  final transactionRef =
  FirebaseFirestore.instance.collection('TopUpPayment').doc();
  final TextEditingController _depositAmount= TextEditingController();

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

  //topup payment
  Future<void> topUp() async {

    if (pickedImage == null){
      Fluttertoast.showToast(
        msg: "Please Select Image",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;

    }
    FirebaseFirestore db = FirebaseFirestore.instance;
    Reference storageRef = FirebaseStorage.instance.ref();
    String dt = DateTime.now().millisecondsSinceEpoch.toString();
    var photo = await storageRef.child("topUpPayment").child("$dt.jpg").putFile(File(pickedImage!.path));
    var url = await photo.ref.getDownloadURL();

    TopUpPayment data = TopUpPayment(
      id: transactionRef.id,
      userId: userId,
      amount: _depositAmount.text,
      image: url,
      status: "Pending",
      userName: userName,
      date: DateTime.now().toString(),);

    db.collection("TopUpPayment").add(data.toJson()).then((value) {
      //loading indicator
      Get.dialog(
         Center(
          child: CircularProgressIndicator(
            color: ConstColors.kPrimaryColor,
          )
        ),
      );
      Fluttertoast.showToast(
        msg: "Payment Successful \n Please Wait for Admin Approval",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      Navigator.pop(context);
      Navigator.pop(context);
    }).catchError((error) {
      Fluttertoast.showToast(
        msg: "Payment Failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );

    });

  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: ConstColors.kWhiteColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ConstColors.kBlackColor,
            ),
          ),
          title: Text(
            'Top Up ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: ConstFonts.bold,
              color: ConstColors.kBlackColor,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [







              ],
            ),
          ),
        ));
  }
}


