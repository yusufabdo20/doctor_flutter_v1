import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gen_extension/gen_extension.dart';

import 'notification_bloc/notification_bloc.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String initalDate = DateTime.now()
      .subtract(const Duration(days: 30))
      .toIso8601String()
      .split('T')[0];
  String finalDate = DateTime.now().toIso8601String().split('T')[0];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationBloc()..add(GetNotificationEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
        ),
        body: BlocConsumer<NotificationBloc, NotificationState>(
          listener: (context, state) {
            if (state is NotificationError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            } else if (state is NotificationSeenSuccessfuy) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Notification seen successfully'),
                ),
              );

              context.read<NotificationBloc>().add(GetNotificationEvent(
                  from: initalDate,
                  to: finalDate,
                  page: context.read<NotificationBloc>().page));
            }
          },
          buildWhen: (previous, current) {
            if (current is NotificationLoaded ||
                current is NotificationError ||
                current is NotificationLoading) {
              return true;
            }
            return true;
          },
          builder: (context, state) {
            NotificationBloc notificationBloc =
                BlocProvider.of<NotificationBloc>(context);

            if (state is NotificationLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NotificationLoaded) {
              return Column(
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {
                            notificationBloc.add(NotificationSeenEvent(id: ''));
                          },
                          child: SizedBox(
                            // width: 103.w,
                            child: Text(
                              "Show All".tr(),
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                color: Color(0xFF2874E1),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDateRangePicker(
                              context: context,
                              firstDate: DateTime.now()
                                  .subtract(const Duration(days: 30)),
                              lastDate: DateTime.now(),
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    colorScheme: const ColorScheme.light(
                                      primary: Color(0xFF0B264E),
                                      onPrimary: Colors.white,
                                    ),
                                  ),
                                  child: child!,
                                );
                              }).then((value) {
                            if (value != null) {
                              notificationBloc.page = 1;
                              initalDate =
                                  value.start.toIso8601String().split('T')[0];
                              finalDate =
                                  value.end.toIso8601String().split('T')[0];
                              notificationBloc.add(GetNotificationEvent(
                                from: initalDate,
                                to: finalDate,
                              ));
                            }
                          });
                        },
                        child: Container(
                          height: 40.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.37.w, vertical: 5.08.h),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFFD0D1D2)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '$initalDate - $finalDate',
                                style: TextStyle(
                                  color: const Color(0xFF0B264E),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 10.37.w),
                              Icon(
                                Icons.calendar_month,
                                color: const Color(0xFF0B264E),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: notificationBloc.scrollController
                        ..addListener(() {
                          notificationBloc.onScroll();
                        }),
                      itemCount:
                          state.notificationModel.notifications!.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (state.notificationModel.notifications!
                                    .data![index].seen ==
                                0) {
                              notificationBloc.add(NotificationSeenEvent(
                                  id: state.notificationModel.notifications!
                                      .data![index].id!));
                            }

                            String info = state.notificationModel.notifications!
                                .data![index].data!.id!;
                            String type = state.notificationModel.notifications!
                                .data![index].data!.event!;
                            Map<String, dynamic> data = jsonDecode(info);
                            // String generalID = data['general_id'];
                            print(data['generalId']);

                            // if (type == 'order') {
                            //   Navigator.of(context).push(
                            //     MaterialPageRoute(
                            //       builder: (context) => OrderDetails(
                            //         orderID: data['generalId'].toString(),
                            //       ),
                            //     ),
                            //   );
                            // } else if (type == 'store') {
                            //   context.pushNamed(PageName.storeProductScreen,
                            //       extra: StoreProductScreenParams(
                            //           id: data['generalId'].toString()));
                            // }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 24.w,
                                      height: 24.h,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment(-1.00, 0.00),
                                          end: Alignment(1, 0),
                                          colors: [
                                            Color(0xFF2B61DC),
                                            Color(0xFF33D3F5)
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(13.45),
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.notifications,
                                      )),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  SizedBox(
                                    width: 250.w,
                                    height: 69.h,
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "${state.notificationModel.notifications!.data![index].notification!.title!}\n",
                                            style: TextStyle(
                                              color: Color(0xFF0B264E),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          TextSpan(
                                            text: state
                                                .notificationModel
                                                .notifications!
                                                .data![index]
                                                .notification!
                                                .body!
                                                .message!,
                                            style: TextStyle(
                                              color: Color(0xFF4F4F4F),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  state.notificationModel.notifications!
                                              .data![index].seen ==
                                          1
                                      ? const SizedBox.shrink()
                                      : Container(
                                          width: 8,
                                          height: 8,
                                          decoration: const ShapeDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment(0.80, 0.60),
                                              end: Alignment(-0.8, -0.6),
                                              colors: [
                                                Color(0xFF2D53DA),
                                                Color(0xAB8700FF),
                                                Color(0xFF1CCEF4),
                                                Color(0x008700FF)
                                              ],
                                            ),
                                            shape: OvalBorder(),
                                          ),
                                        )
                                ]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is NotificationError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: Text('Error'),
              );
            }
          },
        ),
      ),
    );
  }
}
