import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FireBaseMessagingSystem {
  static final FirebaseMessaging messaging = FirebaseMessaging.instance;
  static Future<AuthorizationStatus> getPermissionStatus() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    return (await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: true,
      sound: true,
    ))
        .authorizationStatus;
  }

  static Future<String?> get fcmToken async {
    return await messaging.getToken();
  }

  static setMessagingInBackGround() {
    FirebaseMessaging.onMessage.listen(_notificationHandler);

    // FirebaseMessaging.onBackgroundMessage(_notificationHandler);
  }

  static setMessagingInForeGround() {
    FirebaseMessaging.onMessage.listen(_notificationHandler);
  }

  static setOnClickMessaging() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      debugPrint("setOnClickMessaging");
      debugPrint(message.data.toString());
      // ctx!.push(PageName.notificationScreen);
    });
  }

  // static Future<void> _notificationHandler(
  //   RemoteMessage message,
  // ) async {
  //   const AndroidNotificationChannel channel = AndroidNotificationChannel(
  //     'medical.rep', // id
  //     'High Importance Notifications', // title// description
  //     importance: Importance.max,
  //   );

  //   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //       FlutterLocalNotificationsPlugin();
  //   await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           AndroidFlutterLocalNotificationsPlugin>()
  //       ?.createNotificationChannel(channel);

  //   if (message.notification != null) {
  //     flutterLocalNotificationsPlugin.show(
  //         message.notification.hashCode,
  //         message.notification!.title,
  //         message.notification!.body,
  //         NotificationDetails(
  //             android: AndroidNotificationDetails(
  //               icon: 'ic_launcher',
  //               channel.id,
  //               channel.name,
  //               channelDescription: channel.description,
  //               // other properties...
  //             ),
  //             iOS: const DarwinNotificationDetails(
  //               presentAlert: true,
  //             )));
  //   }
  // }
  static Future<void> _notificationHandler(
    RemoteMessage message,
  ) async {
    debugPrint("Amr");

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'medical.rep', // id
      'High Importance Notifications', // title// description
      importance: Importance.max,
    );
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    if (message.notification != null) {
      flutterLocalNotificationsPlugin.show(
          message.notification.hashCode,
          message.notification!.title,
          message.notification!.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
                icon: 'ic_launcher',
                channel.id,
                channel.name,
                channelDescription: channel.description,
                // other properties...
              ),
              iOS: const DarwinNotificationDetails(
                presentAlert: true,
              )));
    }
  }

  static Future<void> testNotificaitonLocal() async {
    debugPrint("Amr");

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'medical.rep', // id
      'High Importance Notifications', // title// description
      importance: Importance.max,
    );
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    flutterLocalNotificationsPlugin.show(
        1,
        "@",
        "@",
        NotificationDetails(
            android: AndroidNotificationDetails(
              icon: 'ic_launcher',
              channel.id,
              channel.name,
              channelDescription: channel.description,
              // other properties...
            ),
            iOS: const DarwinNotificationDetails(
              presentAlert: true,
            )));
  }

  static void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {}

  static void onDidReceiveNotificationResponse(NotificationResponse details) {
    if (details.notificationResponseType ==
        NotificationResponseType.selectedNotification) {
      // ctx!.push(PageName.notificationScreen);
    }
  }
}
