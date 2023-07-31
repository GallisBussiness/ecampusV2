import 'dart:convert';

import 'package:ecampusv2/app/data/providers/compte_provider.dart';
import 'package:ecampusv2/app/modules/validations.dart';
import 'package:ecampusv2/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController with Validations {
  final code = ''.obs;
  final password = ''.obs;
  final isLoading = false.obs;
  CompteProvider compteProvider = CompteProvider();
  GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  void login() {
    isLoading(true);
    compteProvider.getCompte(code.value, password.value).then((res) {
      storage.write('ecampus_compte', jsonEncode(res));
      isLoading(false);
      Get.offAndToNamed(Routes.HOME);
    }, onError: (err) {
      isLoading(false);
      Get.snackbar('Login Message', 'La connexion a échouée',
          backgroundColor: Colors.red, colorText: Colors.white);
    });
  }

  @override
  void onClose() {
    super.onClose();
    code.close();
    password.close();
    isLoading.close();
  }
}
