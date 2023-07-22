import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

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
    var styleinformationDesign;
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
        print("Notification Error ${e}");
      }
    }

    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails("myapp", "myapp channel",
            channelDescription: "Channel Description",
            importance: Importance.max,
            priority: Priority.high,
            styleInformation: styleinformationDesign),
        iOS: DarwinNotificationDetails());
    _notificationsPlugin.show(id, title, body, notificationDetails, payload: payload);
  }
}
