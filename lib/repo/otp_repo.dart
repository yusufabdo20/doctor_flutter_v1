import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/core/error/error_hander.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/network/end_point.dart';
import 'package:doctor_flutter_v1/model/user/user_model.dart';

abstract class OtpRepo {
  Future<Either<Failures, UserModel>> verifyOtp({
    required String email,
    required String otp,
  });

  Future<Either<Failures, String>> resendOtp({required String email});
}

class OtpRepoImpl implements OtpRepo {
  @override
  Future<Either<Failures, UserModel>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      Response response = await DioHelper.postData(
        url: EndPoint.verifyUser(email: email, otp: otp),
      );
      return Right(UserModel.fromJson(response.data));
    } on DioException catch (dioError) {
      log(dioError.response.toString());
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> resendOtp({required String email}) async {
    try {
      Response response = await DioHelper.postData(
        url: EndPoint.resendVerifyEmail(
          email: email,
        ),
      );
      return Right(response.data["message"]);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
