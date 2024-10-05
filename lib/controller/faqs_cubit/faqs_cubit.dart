import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_flutter_v1/core/error/error_hander.dart';
import 'package:doctor_flutter_v1/model/faqs/faqs_model.dart';
import 'package:doctor_flutter_v1/repo/faqs_repo.dart';

import 'package:meta/meta.dart';

part 'faqs_state.dart';

class FaqsCubit extends Cubit<FaqsState> {
  FaqsRepo faqsRepo;
  FaqsCubit({required this.faqsRepo}) : super(FaqsInitial());

  Future<void> getFaqs() async {
    emit(FaqsLoading());
    Either<Failures, FaqsModel> result = await faqsRepo.getFaqs();
    result.fold(
      (l) => emit(FaqsError(l.errorMessage)),
      (r) => emit(FaqsLoaded(r)),
    );
  }
}
