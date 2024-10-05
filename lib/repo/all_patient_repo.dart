import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/core/error/error_hander.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/network/end_point.dart';
import 'package:doctor_flutter_v1/core/services/cache/app_cache_key.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/model/patient/patient_model.dart';

abstract class AllPatientRepo {
  Future<Either<Failures, PatientModel>> getAllPatient(
      {required int page, String? search, int? perPage});
}

class AllPatientRepoImpl extends AllPatientRepo {
  @override
  Future<Either<Failures, PatientModel>> getAllPatient(
      {required int page, String? search, int? perPage}) async {
    try {
      Response response = await DioHelper.getData(
          url: EndPoint.patients,
          token: CacheService.getString(key: AppCacheKey.token),
          queryParameters: {"page": page, "name": search, "per_page": perPage});
      return Right(PatientModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
