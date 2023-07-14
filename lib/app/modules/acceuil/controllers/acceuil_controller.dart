import 'dart:convert';

import 'package:ecampusv2/app/data/models/compte_model.dart';
import 'package:ecampusv2/app/data/providers/compte_provider.dart';
import 'package:ecampusv2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AcceuilController extends GetxController {
  GetStorage storage = GetStorage();
  Compte compte = Compte();
  CompteProvider compteProvider = CompteProvider();
  final isSoldeShow = false.obs;

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

  load() {
    compteProvider.load(compte.sId!).then((value) => compte = value!,
        onError: (err) => Get.snackbar(
            'Compte status', 'Error lors du rafraichissement !',
            colorText: Colors.white, backgroundColor: Colors.red));
  }

  void hideSolde() {
    isSoldeShow(false);
  }

  void showSolde() {
    isSoldeShow(true);
  }

  void logout() {
    storage.remove('ecampus_compte');
    Get.offAndToNamed(Routes.LOGIN);
  }
}
