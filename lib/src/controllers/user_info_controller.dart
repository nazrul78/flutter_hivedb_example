import 'dart:developer';

import 'package:flutter_hivedb_example/src/models/user_info.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';

class UserInfoController extends GetxController {
  //final userList = RxList<User>([]);
  final isLoading = RxBool(false);
  // List<UserInfo> userInfoList = [];

  final userInfo = UserInfo(
    userName: 'nazrul78',
    fullName: 'Nazrul Islam',
    adderss: 'Dhaka',
    email: 'nazrul@gmail.com',
    phoneNo: '01725469857',
    appCode: 'Demo1',
    appName: 'bemo2',
  );

  /// To get users from server.
  Future<void> dataStoreInHive() async {
    isLoading.value = true;
    final userInfoBox = Hive.box<List<UserInfo>>('userInfo');
    log('Started >>>>>>>>>>>>>>>>>>>>>');
    try {
      for (var i = 0; i < 500; i++) {
        await insartNewRow();
        var users = userInfoBox.get('user_information');

        if (users != null) {
          log('User Data length: ${users.length}');
        }
      }

      log('Finished >>>>>>>>>>>>>>>>>>>>>');
    } catch (e) {
      log(e.toString() + 'Something wrong!!');
      isLoading.value = false;
    }

    isLoading.value = false;
  }

  /// To get users from server.
  Future<void> getAllDataFromHive() async {
    isLoading.value = true;

    try {
      final userInfoBox = Hive.box<List<UserInfo>>('userInfo');

      var users = userInfoBox.get('user_information');
      if (users != null) {
        log('Data length : ${users.length}');
      }
    } catch (e) {
      log(e.toString() + 'Cannot get All data!!');
      isLoading.value = false;
    }

    isLoading.value = false;
  }

  Future<void> insartNewRow() async {
    List<UserInfo> userInfoList = [];
    try {
      final userInfoBox = Hive.box<List<UserInfo>>('userInfo');

      var users = userInfoBox.get('user_information');

      if (users != null && users.length > 0) {
        log('lllllllllll');
        userInfoList.addAll(users);
        userInfoList.add(userInfo);
      } else {
        log('ffffffffff');

        userInfoList.add(userInfo);
      }

      await userInfoBox.put(
        'user_information',
        userInfoList,
      );
    } catch (e) {
      log(e.toString() + 'Cannot save data in hive db');
      isLoading.value = false;
    }

    // userList.value = [];
    // // userList.clear();
    // log('${userList.length}');
  }

  // /// To get users from hive db.
  // Future<void> getUserDataFromHiveDb() async {
  //   // isLoading.value = true;
  //   try {
  //     final userBox = Hive.box('user');
  //     //await patrolScheduleBox.clear();

  //     //local db put
  //     // userBox.put(
  //     //   'user_info',
  //     //   users,
  //     // );
  //     var users = userBox.get('user_info');

  //     userList.addAll(users);
  //     log('${users[0].name}');
  //     log('${users[0].username}');
  //   } catch (e) {
  //     log('$e');
  //     // isLoading.value = false;
  //   }
  // }

  // void clearUsers() {
  //   userList.value = [];
  //   // userList.clear();
  //   log('${userList.length}');
  // }
}
