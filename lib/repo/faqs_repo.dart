import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/core/error/error_hander.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/network/end_point.dart';
import 'package:doctor_flutter_v1/model/faqs/faqs_model.dart';

abstract class FaqsRepo {
  Future<Either<Failures, FaqsModel>> getFaqs();
}

class FaqsRepoImpl implements FaqsRepo {
  @override
  Future<Either<Failures, FaqsModel>> getFaqs() async {
    try {
      Response response =
          await DioHelper.getData(url: EndPoint.getFaqs, options: Options());
      return Future.value(right(FaqsModel.fromJson(response.data)));
    } on DioException catch (dioError) {
      return Future.value(left(ServerFailure.fromDioError(dioError)));
    } catch (e) {
      return Future.value(left(LocalFailures(errorMessage: e.toString())));
    }
  }
}
