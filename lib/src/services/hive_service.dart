import 'dart:io';

import 'package:flutter_hivedb_example/src/models/user_info.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../models/user.dart';

class HiveService extends GetxService {
  Future<void> onInitForApp() async {
    Directory appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    await registerAdapters();
    await openBoxes();
  }

  Future<void> registerAdapters() async {
    Hive.registerAdapter(UserAdapter(), override: true);
    Hive.registerAdapter(AddressAdapter(), override: true);
    Hive.registerAdapter(GeoAdapter(), override: true);
    Hive.registerAdapter(UserInfoAdapter(), override: true);
  }

  Future<void> openBoxes() async {
    await Hive.openBox(
      'user',
    );
    await Hive.openBox<List<UserInfo>>(
      'userInfo',
    );
  }

  Future<void> closeHiveBoxes() {
    return Hive.close();
  }
}
