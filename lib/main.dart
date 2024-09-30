import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/core/services/my_observer.dart';
import 'package:doctor_flutter_v1/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();

  await CacheService.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await EasyLocalization.ensureInitialized();
  



  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    child: const MyApp(),
  ));
}
