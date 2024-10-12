import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';

// import '../../../../../res/constatnts/end_points/end_points.dart';
// import '../../../../../utils/error/failure.dart';
// import '../../../../../utils/helpers/dio_helper/dio_helper.dart';
import '../../../../core/error/error_hander.dart';
import '../../../../core/network/end_point.dart';
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
        url: EndPoint.notifications,
      );
      return Right(NotificationModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> seenNotification(
      NotificationSeenEvent notificationSeenEvent) async {
    try {
      Response response = await DioHelper.postData(
          url: EndPoint.notificationsMarkAsSeen,
          data: {
            'notification_ids': [notificationSeenEvent.id]
          });
      return Right(response.data['message']);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
