import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripdash/Screens/Hotel_view/hotel_home_screen.dart';
import 'package:tripdash/Screens/UserScreen/ViewProducts/ViewProducts.dart';
import 'package:tripdash/Screens/UserScreen/user_dashboard.dart';
import 'package:tripdash/widget/bottom_navigation_bar.dart';
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
        initialRoute: ViewProducts.routeName,
        routes: routes,
      ),
    );
  }
}
