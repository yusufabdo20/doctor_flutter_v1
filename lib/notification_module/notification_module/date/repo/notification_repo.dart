import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/error/error_hander.dart';
import '../../../../core/network/dio_helper.dart';
import '../../../../core/services/cache/app_cache_key.dart';
import '../../../../core/services/cache/cache_service.dart';
import '../../notification_bloc/notification_bloc.dart';
import '../model/notifications_model/notifications_model.dart';

abstract class NotificationRepo {
  Future<Either<Failures, NotificationModel>> getNotification(
      GetNotificationEvent getNotificationEvent);
  Future<Either<Failures, String>> seenNotification(
      NotificationSeenEvent notificationSeenEvent);
}

class NotificationRepoImpl extends NotificationRepo {
  @override
  Future<Either<Failures, NotificationModel>> getNotification(
      GetNotificationEvent getNotificationEvent) async {
    try {
      Response response = await DioHelper.getData(
        url: '/notifications',
        queryParameters: getNotificationEvent.toJson(),
        token: CacheService.getString(key: AppCacheKey.token),
      );
      return Right(NotificationModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> seenNotification(
      NotificationSeenEvent notificationSeenEvent) async {
    try {
      Response response = await DioHelper.postData(
        url: '/notifications/markAsSeen',
        data: {
          'id': [notificationSeenEvent.id]
        },
        token: CacheService.getString(key: AppCacheKey.token),
      );
      return Right(response.data['message']);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
