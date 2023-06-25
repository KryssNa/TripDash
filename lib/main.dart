import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:tripdash/Screens/ViewPlace/PlaceHomeScreen.dart';


import 'package:get/get.dart';

import 'Helper/multiProvider.dart';
import 'NavigationPage/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return multiProvider(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: PlaceHomeScreen.routeName,
        routes: routes,
      ),
    );
  }
}
