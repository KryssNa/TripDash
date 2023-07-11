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

    if(_depositAmount.text.isEmpty){
      Fluttertoast.showToast(
        msg: "Please Enter Amount",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

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

  Future<void> getDetails() async{
    UserModel? user =await  UserRepositeries.getLoggedInUser();
    userName = user?.name!;
    userId = user?.userId!;
  }

  @override
  void initState() {
    getDetails();
    super.initState();
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
                Container(
                  height: 240,
                  width: double.infinity,
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRect(
                    child: pickedImage != null ? Image.file(
                      pickedImage!,
                      width: double.infinity,
                      height: 240,
                      fit: BoxFit.cover,
                    )
                        : Image.asset('Assets/icons/uploadSS.png'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32,vertical: 24 ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: ConstColors.kWhiteColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Enter amount to deposit',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: ConstFonts.semiBold,
                            color: ConstColors.kBlackColor,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 8),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: ConstColors.kGreyColor,
                          ),
                        ),
                        child: TextFormField(
                          controller: _depositAmount,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Amount',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: ConstFonts.regular,
                              color: ConstColors.kGreyColor,
                            ),
                            contentPadding: const EdgeInsets.only(left: 16),
                          ),

                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  // dialogue box to show receiver accout details
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Receiver Account Details'),
                              content:  const SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text.rich(
                                      TextSpan(
                                        text: 'E-Sewa : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '9811787904',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.green)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: 'Ime-Pay : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '9811787904',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.green)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: 'Khalti : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '9811787904',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.green)),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });

                    },
                    child: const Text('Receiver Account Details'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Upload Payment Screenshot * \n     to confirm your payment',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: ConstFonts.semiBold,
                      color: ConstColors.kRedColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 24),
                  child: CustomButton(
                    title: 'Upload Now',
                    onPressed: () {
                      imagePickerOption();
                      }
                      //alertDialog(context); to show trasaction status

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: CustomButton(
                    title: 'Confirm Payment',
                    onPressed: () {
                      if (kDebugMode) {
                        print('Performing Transaction........');
                      }
                      topUp();
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}


