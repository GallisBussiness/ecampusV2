import 'dart:convert';
import 'package:ecampusv2/app/modules/transaction/operation_model.dart';
import 'package:ecampusv2/app/modules/transaction/providers/operation_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TransactionController extends GetxController
    with StateMixin<List<Operation?>> {
  OperationProvider operationProvider = OperationProvider();
  GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    load();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void load() {
    Compte currentCompte =
        Compte.fromJson(jsonDecode(storage.read('ecampus_compte')));
    String id = currentCompte.sId!;
    operationProvider.getLatestOperations(id).then((value) {
      change(value, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
