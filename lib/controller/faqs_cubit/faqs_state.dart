part of 'faqs_cubit.dart';

@immutable
sealed class FaqsState {}

final class FaqsInitial extends FaqsState {}

final class FaqsLoading extends FaqsState {}

final class FaqsLoaded extends FaqsState {
  final FaqsModel faqsModel;
  FaqsLoaded(this.faqsModel);
}

final class FaqsError extends FaqsState {
  final String errorMessage;
  FaqsError(this.errorMessage);
}
