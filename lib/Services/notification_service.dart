import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();


  static void initialize() {

    _notificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();

    const InitializationSettings initializationSettings = InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: DarwinInitializationSettings(
            requestSoundPermission: false,
            requestBadgePermission: false,
            requestAlertPermission: false));
    _notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  static BuildContext? context;
  static void onDidReceiveNotificationResponse(NotificationResponse? response) {
    if (response != null && response.payload != null) {
      Navigator.of(context!).pushNamed(response.payload.toString());
      if (kDebugMode) {
        print(response.payload);
      }
    }
  }

  static Future<String> getImageFilePathFromAssets(String asset, String filename) async {
    final byteData = await rootBundle.load(asset);
    final tempDireactory = await getTemporaryDirectory();
    final file = File('${tempDireactory.path}/$filename');
    await file
        .writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file.path;
  }

  static Future<void> display(
      {required String title,
      required String body,
      String? payload,
      BuildContext? buildContext,
      String? image,
      String? logo}) async {
    if (buildContext != null) {
      context = buildContext;
    }

    // if image from asset
    var styleinformationDesign=const DefaultStyleInformation(true,true);
    if (image != null && logo != null) {
      late AndroidBitmap<Object>? notificationImage;
      late AndroidBitmap<Object>? notificationLogo;
      try {
        var imageLoader = await getImageFilePathFromAssets(image, 'bigpicture');
        notificationImage = FilePathAndroidBitmap(imageLoader);
        var imageLoaderLogo = await getImageFilePathFromAssets(logo, 'smallpicture');
        notificationLogo = FilePathAndroidBitmap(imageLoaderLogo);
        styleinformationDesign = BigPictureStyleInformation(
          notificationImage,
          largeIcon: notificationLogo,
        );
      } catch (e) {
        if (kDebugMode) {
          print("Notification Error $e");
        }
      }
    }

    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails("myapp", "myapp channel",
            channelDescription: "Channel Description",
            importance: Importance.max,
            priority: Priority.high,
            styleInformation: styleinformationDesign),
        iOS: const DarwinNotificationDetails());
    _notificationsPlugin.show(id, title, body, notificationDetails, payload: payload);
  }
}