import 'package:get/get.dart';

import '../controllers/config_controller.dart';
import '../controllers/home_controller.dart';

class Base {
  //********** All Controlers *****************
  final configC = Get.put(ConfigController());
  final homeC = Get.put(HomeController());
}
