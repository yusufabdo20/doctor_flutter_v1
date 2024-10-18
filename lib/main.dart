import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/core/services/my_observer.dart';
import 'package:doctor_flutter_v1/firebase_options.dart';
import 'package:doctor_flutter_v1/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'notification_module/notification_module/notification/firebase_messaging_system.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();

  await CacheService.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  await FireBaseMessagingSystem.getPermissionStatus();
  FireBaseMessagingSystem.setMessagingInBackGround();
  // FireBaseMessagingSystem.setOnClickMessaging();
  FireBaseMessagingSystem.setMessagingInForeGround();
  print('fcmToken: ${await FireBaseMessagingSystem.fcmToken}');
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    child: const MyApp(),
  ));
}
