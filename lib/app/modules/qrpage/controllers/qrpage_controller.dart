import 'dart:convert';

import 'package:ecampusv2/app/data/models/compte_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class QrpageController extends GetxController {
  GetStorage storage = GetStorage();
  Compte compte = Compte();

  @override
  void onInit() {
    super.onInit();
    compte = Compte.fromJson(jsonDecode(storage.read('ecampus_compte')));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
