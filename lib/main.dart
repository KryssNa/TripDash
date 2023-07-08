import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripdash/Screens/AdminScreen/add_place.dart';
import 'package:tripdash/Screens/UserScreen/HelpAndSupport.dart';
import 'package:tripdash/Screens/ViewPlace/place_screen.dart';

import 'Helper/multi_provider.dart';
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

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProviderWidget(
      child: GetMaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: HelpSupportPage.routeName,
        routes: routes,
      ),
    );
  }
}
