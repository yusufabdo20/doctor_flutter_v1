import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/core/error/error_hander.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/network/end_point.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class RegisterRepo {
  Future<Either<Failures, bool>> registerUser({
    required String email,
    required String password,
    required String userName,
    required String phone,
    required String role,
    required String countryCode,
  });
}

class RegisterRepoImpl extends RegisterRepo {
  @override
  Future<Either<Failures, bool>> registerUser({
    required String email,
    required String password,
    required String userName,
    required String phone,
    required String role,
    required String countryCode,
  }) async {
    try {
      Response response =
          await DioHelper.postData(url: EndPoint.register, data: {
        "name": userName,
        "email": email,
        "password": password,
        "phone": "+$phone",
        "role": role,
        "lang": 'en',
        "country_code": countryCode,
        "fcm_token": await FirebaseMessaging.instance.getToken(),
      });
      return const Right(true);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
