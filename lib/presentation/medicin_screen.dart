import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_text.dart';
import 'package:doctor_flutter_v1/model/medicin_model.dart';
import 'package:flutter/material.dart';

import '../core/services/cache/app_cache_key.dart';

class MedicinScreen extends StatefulWidget {
  const MedicinScreen({super.key});

  @override
  State<MedicinScreen> createState() => _MedicinScreenState();
}

class _MedicinScreenState extends State<MedicinScreen> {
  Future<UserMedicinModel> getUserMdedicin() async {
    Response response = await DioHelper.getData(
        url: '/medicines',
        token: CacheService.getString(key: AppCacheKey.token) ?? '');
    return UserMedicinModel.fromJson(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<UserMedicinModel>(
          future: getUserMdedicin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Table(
                border: TableBorder.all(),
                children: [
                  const TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomText(
                        text: 'name',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomText(
                        text: 'repeatedPerDay',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomText(
                        text: 'startDate',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomText(
                          text: 'endDate',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ]),
                  ...snapshot.data!.data!.map((e) {
                    return TableRow(children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(e.name!)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(e.repeatedPerDay.toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(e.startDate.toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(e.endDate.toString()),
                      ),
                    ]);
                  }).toList()
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
