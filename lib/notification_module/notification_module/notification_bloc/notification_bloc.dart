import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../date/model/notifications_model/notifications_model.dart';
import '../date/repo/notification_repo.dart';


part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationRepo notificationRepo = NotificationRepoImpl();
  ScrollController scrollController = ScrollController();
  NotificationModel? notificationModel;
  int page = 1;

  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) async {
      if (event is GetNotificationEvent) {
        if (page == 1) {
          notificationModel = null;
          emit(NotificationLoading());
        }

        final result = await notificationRepo.getNotification(event);
        result.fold((l) => emit(NotificationError(message: l.errorMessage)), (r) {
          if (notificationModel != null) {
            r.notifications!.data!
                .insertAll(0, notificationModel!.notifications!.data!);
          } else {
            notificationModel = r;
          }
          emit(NotificationLoaded(notificationModel: r));
        });
      } else if (event is NotificationSeenEvent) 
      {
        final result = await notificationRepo.seenNotification(event);
        result.fold((l) => emit(NotificationError(message: l.errorMessage)), (r) 
        {
          emit(NotificationSeenSuccessfuy(
              notificationModel: notificationModel!));
        });
      }
    });
  }
  void onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (notificationModel!.notifications!.lastPage! <= page) {
        page++;
        add(GetNotificationEvent(page: page));
      }
    }
  }
}
