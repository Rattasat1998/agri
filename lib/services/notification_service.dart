import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:agri/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';

import '../main.dart';

/// A notification action which triggers a url launch event
String urlLaunchActionId = 'id_1';

/// A notification action which triggers a App navigation event
String navigationActionId = 'id_3';

/// Defines a iOS/MacOS notification category for text input actions.
String darwinNotificationCategoryText = 'textCategory';

/// Defines a iOS/MacOS notification category for plain actions.
String darwinNotificationCategoryPlain = 'plainCategory';


@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print('notification action tapped with input: ${notificationResponse.input}');
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print('Handling a background message ${message.data['payload']}');
  String payload = message.data['payload'] ?? '';
  print(payload);
  // Add the payload to the stream
  // selectNotificationStream.add(payload);
  WidgetsBinding.instance.addPostFrameCallback((_) => HapticFeedback.vibrate());
}

AndroidInitializationSettings initializationSettingsAndroid =
    const AndroidInitializationSettings('@mipmap/launcher_icon');
final List<DarwinNotificationCategory> darwinNotificationCategories = <DarwinNotificationCategory>[
  DarwinNotificationCategory(
    darwinNotificationCategoryText,
    actions: <DarwinNotificationAction>[
      DarwinNotificationAction.text(
        'text_1',
        'Action 1',
        buttonTitle: 'Send',
        placeholder: 'Placeholder',
      ),
    ],
  ),
  DarwinNotificationCategory(
    darwinNotificationCategoryPlain,
    actions: <DarwinNotificationAction>[
      DarwinNotificationAction.plain('id_1', 'Action 1'),
      DarwinNotificationAction.plain(
        'id_2',
        'Action 2 (destructive)',
        options: <DarwinNotificationActionOption>{
          DarwinNotificationActionOption.destructive,
        },
      ),
      DarwinNotificationAction.plain(
        navigationActionId,
        'Action 3 (foreground)',
        options: <DarwinNotificationActionOption>{
          DarwinNotificationActionOption.foreground,
        },
      ),
      DarwinNotificationAction.plain(
        'id_4',
        'Action 4 (auth required)',
        options: <DarwinNotificationActionOption>{
          DarwinNotificationActionOption.authenticationRequired,
        },
      ),
    ],
    options: <DarwinNotificationCategoryOption>{
      DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
    },
  )
];

final DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings(
  requestAlertPermission: false,
  requestBadgePermission: false,
  requestSoundPermission: false,
  onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {
    didReceiveLocalNotificationStream.add(
      ReceivedNotification(
        id: id,
        title: title,
        body: body,
        payload: payload,
      ),
    );
  },
  notificationCategories: darwinNotificationCategories,
);

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

// Callback for handling navigation
typedef NavigationCallback = void Function(String route, Map<String, dynamic> data);

class NotificationService {
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
    macOS: initializationSettingsDarwin,
  );

  void initialState() async {
    print('Notification initialState');
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
        print('onDidReceiveNotificationResponse');
        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            print('selectedNotification');
            selectNotificationStream.add(notificationResponse.payload);
            break;
          case NotificationResponseType.selectedNotificationAction:
            if (notificationResponse.actionId == navigationActionId) {
              selectNotificationStream.add(notificationResponse.payload);
            }
            break;
        }
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
    _isAndroidPermissionGranted();
    _requestPermissions();
    log('Agri : initial notification success');
  }

  static Future<String?> downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName.png';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  Future<void> sendNotification({
    required String title,
    required String body,
}) async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      playSound: true,
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails, iOS: DarwinNotificationDetails(presentSound: true));
    await flutterLocalNotificationsPlugin.show(
        111, title,
        body,
        notificationDetails,
        payload: 'I just haven\'t Met You Yet');
  }

  Future<void> showBigPictureNotification(RemoteMessage message) async {
    String image = message.data['image'] ?? message.data['shop_avartar'];


    try {
      print('image $image');
      if(image.isEmpty){
        print('image is empty');
        showWithoutPicture(message);
      } else {
        print('image is not empty');
        showWithPicture(message);
      }

    } catch (e, t) {
      print('Error t handling navigation: $t');
      print('Error e handling navigation: $e');
    }
  }


  Future<void> showWithPicture(RemoteMessage message) async {
    try {

      final bigPicturePath = await downloadAndSaveFile(message.data['image'] ?? message.data['shop_avartar'], "ShopChill") ?? '';

      final AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        'high_importance_channel',
        'High Importance Notifications',
        channelDescription: 'This channel is used for important notifications.',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        playSound: true,
        styleInformation: BigPictureStyleInformation(
          FilePathAndroidBitmap(bigPicturePath),
          largeIcon: FilePathAndroidBitmap(bigPicturePath),
          hideExpandedLargeIcon: false,
          htmlFormatContentTitle: true, // If you want to use HTML formatting in the content title.
        ),
      );
      final NotificationDetails notificationDetails = NotificationDetails(
          android: androidNotificationDetails,
          iOS: DarwinNotificationDetails(
            attachments: <DarwinNotificationAttachment>[
              DarwinNotificationAttachment(
                bigPicturePath,
              )
            ],
          ));
      await flutterLocalNotificationsPlugin.show(
        1,
        message.data['title'],
        message.data['body'],
        notificationDetails,
        //payload: message.data['payload'],
      );
    } catch (e, t) {
      print('Error t handling navigation: $t');
      print('Error e handling navigation: $e');
    }
  }

  Future<void> showWithoutPicture(RemoteMessage message) async {
    try {

      const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        'high_importance_channel',
        'High Importance Notifications',
        channelDescription: 'This channel is used for important notifications.',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        playSound: true,
      );
      const NotificationDetails notificationDetails = NotificationDetails(
          android: androidNotificationDetails,
          iOS: DarwinNotificationDetails());
      await flutterLocalNotificationsPlugin.show(
        1,
        message.data['title'],
        message.data['body'],
        notificationDetails,
       // payload: message.data['payload'],
      );
    } catch (e, t) {
      print('Error t handling navigation: $t');
      print('Error e handling navigation: $e');
    }
  }


  Future<void> _isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;
    }
  }

  Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

      final bool? grantedNotificationPermission =
          await androidImplementation?.requestNotificationsPermission();
    }
  }
}
