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
    required double lat,
    required double long,
  });
}

class SubmitHealthRecordRepoImp extends SubmitHealthRecordRepo {
  @override
  Future<Either<Failures, SubmitHealthRecordResponseModel>> submitHealthRecord({
    required String bloodPressure,
    required num temperature,
    required num heartRate,
    required String treatmentPlan,
    required double lat,
    required double long,
  }) async {
    try {
      Response response = await DioHelper.postData(
          url:
              "https://health-care-sys.smartleadtech.com/api/patients/health-records",
          data: {
            "blood_pressure": bloodPressure,
            "heart_rate": heartRate,
            "temperature": temperature,
            "treatment_plan": treatmentPlan,
            "lat": lat,
            "long": long,
          },
          token: CacheService.getString(key: AppCacheKey.token));
      return Right(SubmitHealthRecordResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }
}
