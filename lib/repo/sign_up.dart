import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/core/error/error_hander.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/network/end_point.dart';

abstract class RegisterRepo {
  Future<Either<Failures, bool>> registerUser({
    required String email,
    required String password,
    required String userName,
    required String phone,
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
    required String countryCode,
  }) async {
    try {
      Response response =
          await DioHelper.postData(url: EndPoint.register, data: {
        "name": userName,
        "email": email,
        "password": password,
        "phone": "+$phone",
        "lang": 'USER',
        "country_code": countryCode
      });
      return const Right(true);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
