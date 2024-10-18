import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
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
      body: FutureBuilder<UserMedicinModel>(
        future: getUserMdedicin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      "${snapshot.data!.data![index].repeatedPerDay} repated per day"),
                  subtitle: Text(
                      "start date: ${snapshot.data!.data![index].startDate} - end date: ${snapshot.data!.data![index].endDate}"),
                  leading: SizedBox(
                    width: 90,
                    child: Text(
                      " ${snapshot.data!.data![index].name} ",
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
