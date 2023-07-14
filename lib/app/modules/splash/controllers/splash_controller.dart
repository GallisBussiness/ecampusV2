import 'package:ecampusv2/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  GetStorage storage = GetStorage();

  @override
  void onReady() {
    super.onReady();
    var token = storage.read('ecampus_compte');
    if (token != null) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        Get.offAndToNamed(Routes.HOME);
      });
    } else {
      Future.delayed(const Duration(milliseconds: 1000), () {
        Get.offAndToNamed(Routes.LOGIN);
      });
    }
  }
}
