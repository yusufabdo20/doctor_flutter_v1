import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/model/doctors_response_model/doctors_response_model.dart';

import '../core/error/error_hander.dart';
import '../core/network/dio_helper.dart';
import '../core/network/end_point.dart';
import '../core/services/cache/app_cache_key.dart';
import '../core/services/cache/cache_service.dart';
import '../model/appoinment_model.dart';

abstract class AppointmentRepo {
  Future<Either<Failures, List<AppointmentResponseModel>>> getAppointment();
  Future<Either<Failures, DoctorsResponseModel>> getDoctors();
  Future<Either<Failures, AppointmentResponseModel>> submitAppointment({
    required String doctorId,
    required String appointmentDate,
    required String notes,
  });
}

class AppointmentRepoImp extends AppointmentRepo {
  @override
  Future<Either<Failures, List<AppointmentResponseModel>>>
      getAppointment() async {
    try {
      Response response = await DioHelper.getData(
          url: EndPoint.appointments,
          token: CacheService.getString(key: AppCacheKey.token));
      List<AppointmentResponseModel> appointments = [];
      for (var item in response.data['data']) {
        appointments.add(AppointmentResponseModel.fromJson(item));
      }
      return Right(appointments);
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
      return Right(AppointmentResponseModel.fromJson(response.data['data']));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failures, DoctorsResponseModel>> getDoctors() async {
    try {
      Response response = await DioHelper.getData(
          url: EndPoint.doctors,
          token: CacheService.getString(key: AppCacheKey.token));
      return Right(DoctorsResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }
}
