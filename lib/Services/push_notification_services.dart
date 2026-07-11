import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Services/api_services.dart';

class PushNotificationSystem {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  //initialising firebase message plugin
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // Get and Read Access Token OAuth 2.0
  Future<String> getAccessToken() async {
    // final serviceAccountJson = FirebaseJson.json;

    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "libgenius-94544",
      "private_key_id": "ee5a200f8e6279bf6c535b8ba535162435279245",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC4LikLmlaazBgi\n6ReVyhH6q0MPD+nI16I0akI8MeCW4QEMObZ2J1jghPCY+euvrq+SFaK7IvN0JRQF\n41PWeEP8TtZ3M7SPIPExB65RXm47vpDzYt+3PL/CQmI5ikbeQ301KslETK3GeWkk\nXbCr2jNEpczNc9OLWzu61KTlebh+afi0RqggZE9Ce8Wgl1xbz+m5HlFd/qM0MQn7\nStkFuQZSAz61p4D3BlYDqzshhOPtOrPlXwXZsIHGskzZNs7DzprXefQLYmtuRrAJ\n9MWQebuqVb89Jp+Wrl5vBwkAVz/zW2Tj83o4+XV6Qe2YC1PiJz7/M9c6bLmdWUU1\nl+QkTQv/AgMBAAECggEAQ7XorhTUAP3GY9M4sf9DY9nhgeCSTJ2FyupDpniZvi5D\nIdj3zPFDOet1vm+m54P7lOOyW0UKpqjY9x8vW7oEGHZtXw5Zs4LjWOife9eRBBLX\nnDq9z1Icl1CrZscArca2+bxcmOjtu/k3n8B36n4B+htQMzoBTArC5zk01A5PNt2j\n8t3CW7/oTNGAtr4L2dsxIjgF98wE0af2pSj9zm41ZMm+IHIWoUCJueYAwj5DtjIV\nxSPczd2dZc5iQ9LTfDdHIsgQTZBsE61ybHoTz1kLjbDjpyDg9FAyx16Hqgv4Q94J\nDWS7j8NJQgr1XlCg9olo7a/+WIdKiWkz+5MPclghiQKBgQDfKvXUrkTybDj9TuLO\neWvPrgO6ww3yMaWXGLDxDXB8x3Ga5tvStiIU0O5hUkEWUcx+1ioKQq4ckPIEaecX\ndrOuIQXIQT6L8BCywNsJAgVYwERXJQid6+F0Smk1Ts/MOzQVpIxxHHoCN2+egaNv\nClLwX/FbRmEjsmTxd+PSxhGoxwKBgQDTRtYk6N9/uP7i/GnY0fKtU5fWR3JrYs/f\nUJOdx5vbcjxPKNkL5UzMBftLO1bt2vNWRCwrcZUriW1tIzpouLcTQrSMdljKaq5v\nuHVsnjak24nd8xUeGot4+7CjfF039DRTjTlpQQ+f1J6EWV8kHAjHx/M0D/5bQOZR\nnktstDX7CQKBgQDNw4SKJmw3wQUCuZtxmI6JG/8gUfwn1RLCr+dlOmj/A72Bf14r\nd/cQjltcrESK2bzdLYXxk+2JNTOQUjzaa33cDWKRc2bCDAS5bAwI0C4x2ISqfODn\nCrgDSyCaICKEQgoR8nfzSrhMFuT5lrokBbbXHv8gk1G5YiCka1BJ5IofvQKBgAmg\nTp175sMBAMwCyCfS2QXAq0heFP6DkAkSuMcVkypaeBj7OXhrSCZ7l0mEOJ+5vCCQ\nFpscH7nOFyhD1KN01xKPlX5Y3g7K8YuxkdgTFVZJkmyEaM/oUbZ/cTrhrbWg8Mll\nw9nh1v5nR5msIMOaa2P+3jvfBq3NtTC+z5zyUQtRAoGAcbCigQBK6vomumC/F/Zw\nSiiCPDBffBgPQA8UGER0AUdIcpcDUw5Z4tgGgEjYk0XRAQwta5iA3LNuPFI+DzrZ\nIko1W3FZQKdyBmET46/x+UtT+rciRmnq8XpTNns7AeU+BP+cRbqSt5v03jAQH167\nye269g2ycKiBZ3Ei5qWBAsc=\n-----END PRIVATE KEY-----\n",
      "client_email":
          "pushnotification@libgenius-94544.iam.gserviceaccount.com",
      "client_id": "107699510534596598656",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/pushnotification%40libgenius-94544.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com",
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];
    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );
    credentials = await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );
    client.close();
    // Access token and expiration time
    fcmAccessToken = credentials?.accessToken.data ?? '';
    final expiresIn = credentials?.accessToken.expiry;

    // Print access token and its expiration time
    myPrint("Access Token: $fcmAccessToken");
    myPrint("Expires In: $expiresIn");

    return credentials?.accessToken.data ?? '';
  }

  Future<void> initialingCloudMessaging(BuildContext context) async {
    // Required to display foreground notifications on iOS
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

    // Terminated

    // When app is completely closed
    FirebaseMessaging.instance.getInitialMessage().then((
      RemoteMessage? remoteMessage,
    ) {
      if (remoteMessage != null) {
        if (remoteMessage.data['type'] == 'chat') {
          // Get.to(() => const MessagesScreen(showBackButton: true));
        } else {
          showNotification(remoteMessage);
        }
      } else {
        myPrint(remoteMessage);
      }
    });

    // Foreground

    // When  app is open
    FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage) {
      try {
        if (remoteMessage != null) {
          showNotification(remoteMessage);
        }
      } catch (e) {
        myPrint(e);
      }
    });

    // Background

    // When app is in the background and open by the notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMessage) {
      if (remoteMessage != null) {
        if (remoteMessage.data['type'] == 'chat') {
          // Get.to(() => const MessagesScreen(showBackButton: true));
        } else {
          showNotification(remoteMessage);
        }
      }
    });
  }

  // Get and Read FCM Notification Token..
  Future<String> generateAndGetToken() async {
    String? registrationToken = await messaging.getToken();
    fcmToken = registrationToken ?? '';
    myPrint('FCM Token is $registrationToken');
    fcmToken = registrationToken ?? '';
    myPrint('FCM DB Token is $fcmToken');

    final bool isNotification = box.read<bool>('isNotification') ?? true;
    if (isNotification) {
      messaging.subscribeToTopic("rahma-b838c");
      messaging.subscribeToTopic(
        '00${userModel.value.studentData!.userId.toString()}',
      );
    } else {
      messaging.unsubscribeFromTopic("rahma-b838c");
      messaging.unsubscribeFromTopic(
        '00${userModel.value.studentData!.userId.toString()}',
      );
    }

    return registrationToken!;
  }

  // permission method for granting notification permission
  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
    } else {}
  }

  // function to show visible notification when app is active
  Future<void> showNotification(RemoteMessage message) async {
    // Define the Android notification details
    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      '1',
      'High Importance Notifications',
      importance: Importance.max,
    );
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          channel.id.toString(),
          channel.name.toString(),
          icon: "@mipmap/ic_launcher",
          color: whiteColor,
          channelDescription: 'My Channel Discription',
          importance: Importance.high,
          priority: Priority.high,
          ticker: 'ticker',
        );

    // Define the iOS notification details
    const iosNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      presentList: true,
    );

    // Combine both Android and iOS notification details
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );

    Future.delayed(Duration.zero, () async {
      await _flutterLocalNotificationsPlugin.show(
        id: 0,
        title: message.notification!.title.toString(),
        body: message.notification!.body.toString(),
        notificationDetails: notificationDetails,
        payload: jsonEncode(message.data),
      );
    });
  }

  Future<void> setup() async {
    const androidInitializationSetting = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosInitializationSetting = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidInitializationSetting,
      iOS: iosInitializationSetting,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: (payload) {
        if (payload.payload != null) {
          try {
            final data = jsonDecode(payload.payload!);
            if (data['type'] == 'chat') {
              // Get.to(() => const MessagesScreen(showBackButton: true));
            }
          } catch (e) {
            myPrint(e);
          }
        }
      },
    );
  }

  Future<void> requestIOSPermissions() async {
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  void firebaseInit(BuildContext context) {
    // Moved onMessage listener to initialingCloudMessaging
  }

  void initLocalNotifications(
    BuildContext context,
    RemoteMessage message,
  ) async {
    // Moved to setup() to prevent re-initialization on every message
  }

  ApiResponse response = ApiResponse();
  Future<void> sendNotification({
    required String topic,
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    final url = Uri.parse(
      'https://fcm.googleapis.com/v1/projects/rahma-b838c/messages:send',
    );

    final header = {'Authorization': 'Bearer $fcmAccessToken'};
    final apiBody = {
      "message": {
        "topic": topic,
        "notification": {"body": body, "title": title},
        "data": data,
      },
    };
    final response = await http.post(
      url,
      headers: header,
      body: jsonEncode(apiBody),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      myPrint("Notification Sent Successfully");
    } else {
      myPrint("Error sending notification: ${response.body}");
    }
  }
}
