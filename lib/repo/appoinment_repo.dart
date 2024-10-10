import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../core/error/error_hander.dart';
import '../core/network/dio_helper.dart';
import '../core/network/end_point.dart';
import '../core/services/cache/app_cache_key.dart';
import '../core/services/cache/cache_service.dart';
import '../model/appoinment_model.dart';

abstract class AppoinmentRepo {
  Future<Either<Failures, AppoinmentModel>> sendAppoinment({
    required String bloodPressure,
    required num temperature,
    required num heartRate,
    required String treatmentPlan,
  });
}

class AppoinmentRepoImp extends AppoinmentRepo {
  @override
  Future<Either<Failures, AppoinmentModel>> sendAppoinment({
    required String bloodPressure,
    required num temperature,
    required num heartRate,
    required String treatmentPlan,
  }) async {
    try {
      Response response = await DioHelper.postData(
          url: EndPoint.submitHealthRecords,
          data: {
            "blood_pressure": bloodPressure,
            "heart_rate": heartRate,
            "temperature": temperature,
            "treatment_plan": treatmentPlan
          },
          token: CacheService.getString(key: AppCacheKey.token));
      return Right(AppoinmentModel.fromJson(response.data["data"]));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }
}
