import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../core/error/error_hander.dart';
import '../core/network/dio_helper.dart';
import '../core/network/end_point.dart';
import '../core/services/cache/app_cache_key.dart';
import '../core/services/cache/cache_service.dart';
import '../model/appoinment_model.dart';
import '../model/send_appointment_response_model.dart';
import '../model/submit_health_record_response_model/submit_health_record_response_model.dart';

abstract class SubmitHealthRecordRepo {
  Future<Either<Failures, SubmitHealthRecordResponseModel>> submitHealthRecord({
    required String bloodPressure,
    required num temperature,
    required num heartRate,
    required String treatmentPlan,
  });
}

class SubmitHealthRecordRepoImp extends SubmitHealthRecordRepo {
  @override
  Future<Either<Failures, SubmitHealthRecordResponseModel>> submitHealthRecord({
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
      return Right(SubmitHealthRecordResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }
}
