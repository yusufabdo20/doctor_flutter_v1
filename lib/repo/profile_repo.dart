import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/core/error/error_hander.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/network/end_point.dart';
import 'package:doctor_flutter_v1/core/services/cache/app_cache_key.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/model/user/user_model_data.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileRepo {
  Future<Either<Failures, UserModelData>> getProfile();
  Future<Either<Failures, UserModelData>> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String countryCode,
  });

  Future<Either<Failures, String>> updateAvatar({
    required XFile image,
  });
}

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<Either<Failures, UserModelData>> getProfile() async {
    try {
      Response response = await DioHelper.getData(
          token: CacheService.getString(key: AppCacheKey.token),
          url: EndPoint.profile);
      return Right(UserModelData.fromJson(response.data));
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserModelData>> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String countryCode,
  }) async {
    try {
      Response response = await DioHelper.putData(
          token: CacheService.getString(key: AppCacheKey.token),
          url: EndPoint.updateProfile,
          data: {
            "name": name,
            "email": email,
            "phone": phone,
            "country_code": countryCode,
            "lang": "en",
          });

      return Right(UserModelData.fromJson(response.data));
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> updateAvatar({required XFile image}) async {
    try {
      FormData formData = FormData.fromMap({
        "avatar": await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last),
      });
      Response response = await DioHelper.postData(
        token: CacheService.getString(key: AppCacheKey.token),
        url: EndPoint.uploadAvatar,
        data: formData,
      );
      return Right(response.data["message"]);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
