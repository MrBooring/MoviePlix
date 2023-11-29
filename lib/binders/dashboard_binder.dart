import 'package:get/get.dart';
import 'package:movieflix/controllers/dashboard_controller.dart';

class DashboardBinder implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardCotroller>(() => DashboardCotroller(), fenix: true);
  }
}
