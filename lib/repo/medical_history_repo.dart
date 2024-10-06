import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/core/error/error_hander.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/network/end_point.dart';
import 'package:doctor_flutter_v1/core/services/cache/app_cache_key.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/model/medical_history/medical_history_model.dart';

abstract class MedicalHistoryRepo {
  Future<Either<Failures, MedicalHistoryModel>> getMedicalHistory({
    required String id,
    required int page,
  });
}

class MedicalHistoryRepoImpl extends MedicalHistoryRepo {
  @override
  Future<Either<Failures, MedicalHistoryModel>> getMedicalHistory({
    required int page,
    required String id,
  }) async {
    try {
      Response response = await DioHelper.getData(
          url: EndPoint.patientMedicalHistory(id: id),
          token: CacheService.getString(key: AppCacheKey.token),
          queryParameters: {
            "page": page,
          });
      return Right(MedicalHistoryModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
