import 'package:ecampusv2/env.dart';
import 'package:get/get.dart';

import '../models/compte_model.dart';

class CompteProvider extends GetConnect {
  @override
  void onInit() {}

  Future<Compte?> getCompte(String code, String pass) async {
    Map<String, String> data = {'code': code, 'password': pass};
    final response = await post('$backUrl/compte/login', data);
    if (!response.isOk) {
      throw Error();
    }
    return Compte.fromJson(response.body);
  }

  Future<Compte?> changePassword(
      String id, String oldPass, String password) async {
    Map<String, String> data = {'oldPass': oldPass, 'password': password};
    final response = await post('$backUrl/compte/changepassword/$id', data);
    if (!response.isOk) {
      throw Error();
    }
    return Compte.fromJson(response.body);
  }

  Future<Compte?> load(String id) async {
    final response = await get('$backUrl/compte/$id');
    return Compte.fromJson(response.body);
  }
}
