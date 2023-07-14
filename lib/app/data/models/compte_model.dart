class Compte {
  String? sId;
  int? solde;
  Etudiant? etudiant;
  String? code;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Compte(
      {this.sId,
      this.solde,
      this.etudiant,
      this.code,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Compte.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    solde = json['solde'];
    etudiant =
        json['etudiant'] != null ? Etudiant?.fromJson(json['etudiant']) : null;
    code = json['code'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['solde'] = solde;
    if (etudiant != null) {
      data['etudiant'] = etudiant?.toJson();
    }
    data['code'] = code;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Etudiant {
  String? sId;
  String? prenom;
  String? nom;
  String? email;
  String? tel;
  String? password;
  String? dateDeNaissance;
  String? lieuDeNaissance;
  String? avatar;
  String? nce;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Etudiant(
      {this.sId,
      this.prenom,
      this.nom,
      this.email,
      this.tel,
      this.password,
      this.dateDeNaissance,
      this.lieuDeNaissance,
      this.avatar,
      this.nce,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Etudiant.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    prenom = json['prenom'];
    nom = json['nom'];
    email = json['email'];
    tel = json['tel'];
    password = json['password'];
    dateDeNaissance = json['dateDeNaissance'];
    lieuDeNaissance = json['lieuDeNaissance'];
    avatar = json['avatar'];
    nce = json['nce'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['prenom'] = prenom;
    data['nom'] = nom;
    data['email'] = email;
    data['tel'] = tel;
    data['password'] = password;
    data['dateDeNaissance'] = dateDeNaissance;
    data['lieuDeNaissance'] = lieuDeNaissance;
    data['avatar'] = avatar;
    data['nce'] = nce;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
