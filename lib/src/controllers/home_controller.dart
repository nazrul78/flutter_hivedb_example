import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';

import '../models/user.dart';

class HomeController extends GetxController {
  final userList = RxList<User>([]);
  final isLoading = RxBool(false);

  /// To get users from server.
  Future<void> getUsers() async {
    isLoading.value = true;
    try {
      var res = await Dio().get('https://jsonplaceholder.typicode.com/users');

      var rawData = res.data as List;

      log(rawData.toString());

      if (rawData.isNotEmpty) {
        final users = rawData
            .map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList();
        userList.value = users;
        // log('${users.length}');
        // log('${users.first.name}');

        // log('${users.first.address!.city}');
        // log('${users.first.address!.geo!.lat}');

        try {
          final userBox = Hive.box('user');
          //await userBox.clear();

          userBox.put(
            'user_info',
            users,
          );
        } catch (e) {
          log(e.toString() + 'Cannot save data in hive db');
        }
      }
      isLoading.value = false;
    } catch (e) {
      log('$e');
      isLoading.value = false;
    }
  }

  /// To get users from hive db.
  Future<void> getUserDataFromHiveDb() async {
    // isLoading.value = true;
    try {
      final userBox = Hive.box('user');
      //await patrolScheduleBox.clear();

      //local db put
      // userBox.put(
      //   'user_info',
      //   users,
      // );
      var users = userBox.get('user_info');

      userList.addAll(users);
      log('${users[0].name}');
      log('${users[0].username}');
    } catch (e) {
      log('$e');
      // isLoading.value = false;
    }
  }

  void clearUsers() {
    userList.value = [];
    // userList.clear();
    log('${userList.length}');
  }
}
