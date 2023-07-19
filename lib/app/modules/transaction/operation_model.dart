import 'package:ecampusv2/app/modules/transaction/payement_subject_model.dart';

class Operation {
  String? sId;
  int? montant;
  Compte? compte;
  bool? isVirement;
  String? responsable;
  String? type;
  String? description;
  PayementSubject? payementSubject;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Operation(
      {this.sId,
      this.montant,
      this.compte,
      this.isVirement,
      this.responsable,
      this.type,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Operation.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    montant = json['montant'];
    compte = json['compte'] != null ? Compte?.fromJson(json['compte']) : null;
    payementSubject = json['payement_subject'] != null
        ? PayementSubject.fromJson(json['payement_subject'])
        : null;
    isVirement = json['isVirement'];
    responsable = json['responsable'];
    type = json['type'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['montant'] = montant;
    if (compte != null) {
      data['compte'] = compte?.toJson();
    }
    if (payementSubject != null) {
      data['payement_subject'] = payementSubject?.toJson();
    }
    data['isVirement'] = isVirement;
    data['responsable'] = responsable;
    data['type'] = type;
    data['description'] = description;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Compte {
  String? sId;
  int? solde;
  String? code;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Compte(
      {this.sId,
      this.solde,
      this.code,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Compte.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    solde = json['solde'];
    code = json['code'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['solde'] = solde;
    data['code'] = code;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
