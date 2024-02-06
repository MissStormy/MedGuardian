import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:palette_generator/palette_generator.dart';

class NotificationController {
  static NotificationController? _instance;
  static NotificationController get instance {
    _instance ??= NotificationController._();
    return _instance!;
  }

  NotificationController._();

  ReceivedAction? initialAction;

  Future<void> initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
      null, //'resource://drawable/res_app_icon',//
      [
        NotificationChannel(
          channelKey: 'alerts',
          channelName: 'Alerts',
          channelDescription: 'Notification tests as alerts',
          playSound: true,
          onlyAlertOnce: true,
          groupAlertBehavior: GroupAlertBehavior.Children,
          importance: NotificationImportance.High,
          defaultPrivacy: NotificationPrivacy.Private,
          defaultColor: Colors.deepPurple,
          ledColor: Colors.deepPurple,
        )
      ],
      debug: true,
    );

    initialAction = await AwesomeNotifications()
        .getInitialNotificationAction(removeFromActionEvents: false);
  }

  ReceivePort? receivePort;

  Future<void> initializeIsolateReceivePort() async {
    receivePort = ReceivePort('Notification action port in main isolate')
      ..listen(
        (silentData) => onActionReceivedImplementationMethod(silentData),
      );

    IsolateNameServer.registerPortWithName(
      receivePort!.sendPort,
      'notification_action_port',
    );
  }

  Future<void> startListeningNotificationEvents() async {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
    );
  }

  Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    if (receivedAction.actionType == ActionType.SilentAction ||
        receivedAction.actionType == ActionType.SilentBackgroundAction) {
      print(
          'Message sent via notification input: "${receivedAction.buttonKeyInput}"');
      await executeLongTaskInBackground();
    } else {
      if (receivePort == null) {
        print(
            'onActionReceivedMethod was called inside a parallel dart isolate.');
        SendPort? sendPort =
            IsolateNameServer.lookupPortByName('notification_action_port');
        if (sendPort != null) {
          print('Redirecting the execution to main isolate process.');
          sendPort.send(receivedAction);
          return;
        }
      }

      return onActionReceivedImplementationMethod(receivedAction);
    }
  }

  Future<void> onActionReceivedImplementationMethod(
      ReceivedAction receivedAction) async {
    // Handle navigation to notification page
    // MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
    //     '/notification-page',
    //     (route) =>
    //         (route.settings.name != '/notification-page') || route.isFirst,
    //     arguments: receivedAction);
  }

  Future<void> executeLongTaskInBackground() async {
    print('starting long task');
    await Future.delayed(const Duration(seconds: 4));
    final url = Uri.parse("http://google.com");
    final re = await http.get(url);
    print(re.body);
    print('long task done');
  }

  Future<bool> displayNotificationRationale(BuildContext context) async {
    bool userAuthorized = false;
    await showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(
            'Get Notified!',
            style: Theme.of(context).textTheme.headline6,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/images/animated-bell.gif',
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                  'Allow Awesome Notifications to send you beautiful notifications!'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text(
                'Deny',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () async {
                userAuthorized = true;
                Navigator.of(ctx).pop();
              },
              child: Text(
                'Allow',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.deepPurple),
              ),
            ),
          ],
        );
      },
    );
    return userAuthorized &&
        await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  Future<void> createNewNotification(String s) async {
    // Create new notification
  }

  Future<void> scheduleNewNotification() async {
    // Schedule new notification
  }

  Future<void> resetBadgeCounter() async {
    // Reset badge counter
  }

  Future<void> cancelNotifications() async {
    // Cancel all notifications
  }
}
