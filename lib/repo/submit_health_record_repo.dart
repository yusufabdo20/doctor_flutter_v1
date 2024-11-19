import 'dart:developer';
import 'dart:io';

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
    required String? bloodPressure,
    required num? temperature,
    required num? heartRate,
    required String? treatmentPlan,
    required double? lat,
    required double? long,
    required String? breathRate,
    required String? note,
    required String? walkPlan,
  });

  Future<Either<Failures, String>> uploadFile(List<File> file, int id);
}

class SubmitHealthRecordRepoImp extends SubmitHealthRecordRepo {
  @override
  Future<Either<Failures, SubmitHealthRecordResponseModel>> submitHealthRecord({
    required String? bloodPressure,
    required num? temperature,
    required num? heartRate,
    required String? treatmentPlan,
    required double? lat,
    required double? long,
    required String? breathRate,
    required String? note,
    required String? walkPlan,
  }) async {
    try {
      log("---------------------------------------------");

      Response response = await DioHelper.postData(
          url:
              "https://health-care-sys.smartleadtech.com/api/patients/health-records",
          data: {
            "blood_pressure": bloodPressure ?? "N/A",
            "heart_rate": heartRate ?? "0",
            "temperature": temperature ?? "0",
            "treatment_plan": treatmentPlan ?? "N/A",
            "lat": lat,
            "long": long,
            // "breath_rate": breathRate ?? "N/A",
            // "note": note ?? "N/A",
            // "walk_plan": walkPlan ?? "N/A",
          },
          token: CacheService.getString(key: AppCacheKey.token));
      print(response.data);
      log("---------------------------------------------");
      return Right(SubmitHealthRecordResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      print(e.response!.data);
      log("---------------------------------------------");
      print(e.message);

      log("---------------------------------------------");

      print(e.toString());
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log("---------------------------------------------");
      print(e.toString());
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> uploadFile(List<File> file, int id) async {
    try {
      FormData formData = FormData.fromMap(
          {"mediaable_id": id, 'mediaable_type': 'App\\Models\\HealthRecord'});
      for (int i = 0; i < file.length; i++) {
        formData.files.add(MapEntry(
            "files[$i]",
            await MultipartFile.fromFile(file[i].path,
                filename: file[i].path.split("/").last)));
      }
      Response response = await DioHelper.postData(
          url: "/media/upload-multiple",
          data: formData,
          token: CacheService.getString(key: AppCacheKey.token));
      return Right(response.data["message"]);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
