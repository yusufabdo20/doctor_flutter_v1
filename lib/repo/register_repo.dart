import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/core/error/error_hander.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/network/end_point.dart';

abstract class RegisterRepo {
  Future<Either<Failures, String>> registerUser({
    required String email,
    required String password,
    required String userName,
    required String phone,
    required String role,
    required String countryCode,
  });
}

class RegisterRespoImpl extends RegisterRepo {
  @override
  Future<Either<Failures, String>> registerUser({
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
        "phone": phone,
        "lang": 'en',
        "role": role,
        "country_code": countryCode
      });
      log(response.data.toString());
      return Right(response.data["message"]);
    } on DioException catch (dioError) {
      log(dioError.response.toString());
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      log(e.toString());

      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
