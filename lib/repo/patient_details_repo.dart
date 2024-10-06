import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/core/error/error_hander.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/network/end_point.dart';
import 'package:doctor_flutter_v1/core/services/cache/app_cache_key.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/model/patient/patient_model_data.dart';

abstract class PatientDetailsRepo {
  Future<Either<Failures, PatientModelData>> getPatientDetails(
      {required int id});
}

class PatientDetailsRepoImpl extends PatientDetailsRepo {
  @override
  Future<Either<Failures, PatientModelData>> getPatientDetails(
      {required int id}) async {
    try {
      Response response = await DioHelper.getData(
          url: EndPoint.patientDetails(
            id: id.toString(),
          ),
          token: CacheService.getString(key: AppCacheKey.token));
      return Right(PatientModelData.fromJson(response.data["data"]));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
