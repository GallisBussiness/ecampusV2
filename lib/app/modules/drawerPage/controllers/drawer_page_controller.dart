import 'dart:convert';

import 'package:ecampusv2/app/data/models/compte_model.dart';
import 'package:ecampusv2/app/routes/app_pages.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DrawerPageController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Compte currentCompte = Compte();
  GetStorage storage = GetStorage();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    currentCompte = Compte.fromJson(jsonDecode(storage.read('ecampus_compte')));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void logout() {
    storage.remove('ecampus_compte');
    Get.offAndToNamed(Routes.LOGIN);
  }
}
