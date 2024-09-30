import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/core/error/error_hander.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/network/end_point.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failures, String>> forgetPassword({
    required String email,
  });
}

class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  @override
  Future<Either<Failures, String>> forgetPassword({
    required String email,
  }) async {
    try {
      Response response = await DioHelper.postData(
          url: EndPoint.resendVerifyEmail(email: email), data: {});
      return Right(response.data["message"]);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
