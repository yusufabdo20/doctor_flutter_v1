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

abstract class AppointmentRepo {
  Future<Either<Failures, AppointmentResponseModel>> getAppointment();
  Future<Either<Failures, AppointmentResponseModel>> submitAppointment({
    required String doctorId,
    required String appointmentDate,
    required String notes,
  });
}

class AppointmentRepoImp extends AppointmentRepo {
  @override
  Future<Either<Failures, AppointmentResponseModel>> getAppointment() async {
    try {
      Response response = await DioHelper.getData(
          url: EndPoint.appointments,
          token: CacheService.getString(key: AppCacheKey.token));
      return Right(AppointmentResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failures, AppointmentResponseModel>> submitAppointment({
    required String doctorId,
    required String appointmentDate,
    required String notes,
  }) async {
    try {
      Response response = await DioHelper.postData(
          url: EndPoint.appointments,
          data: {
            "doctor_id": doctorId,
            "appointment_date": appointmentDate,
            "notes": notes
          },
          token: CacheService.getString(key: AppCacheKey.token));
      return Right(AppointmentResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }
}
