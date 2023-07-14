import 'package:get/get.dart';

class Validations {
  String? validateName(value) {
    return value.length >= 2 ? null : "doit avoir plus d'une caractères";
  }

  String? validatePassword(value) {
    return value.length >= 6
        ? null
        : "doit avoir un mot de passe au moins 6 caractères";
  }

  String? validateEmail(value) {
    return GetUtils.isEmail(value) ? null : "email invalide";
  }
}
