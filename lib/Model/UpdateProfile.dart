// To parse this JSON data, do
//
//     final updateProfile = updateProfileFromJson(jsonString);

import 'dart:convert';

UpdateProfile updateProfileFromJson(String str) =>
    UpdateProfile.fromJson(json.decode(str));

String updateProfileToJson(UpdateProfile data) => json.encode(data.toJson());

class UpdateProfile {
  UpdateProfile({
    this.azsvr,
    this.userData,
  });

  String azsvr;
  UserData userData;

  factory UpdateProfile.fromJson(Map<String, dynamic> json) => UpdateProfile(
        azsvr: json["AZSVR"],
        userData: UserData.fromJson(json["UserData"]),
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "UserData": userData.toJson(),
      };
}

class UserData {
  UserData({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.emailVerifiedAt,
    this.apiToken,
    this.accountType,
    this.groupsId,
    this.extraPermissions,
    this.active,
    this.hidden,
    this.birthDate,
    this.citiesId,
    this.address,
    this.gendersId,
    this.images,
    this.verificationCode,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String name;
  String phone;
  String email;
  dynamic emailVerifiedAt;
  String apiToken;
  int accountType;
  int groupsId;
  dynamic extraPermissions;
  int active;
  int hidden;
  dynamic birthDate;
  int citiesId;
  dynamic address;
  dynamic gendersId;
  dynamic images;
  int verificationCode;
  dynamic createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        apiToken: json["api_token"],
        accountType: json["account_type"],
        groupsId: json["groups_id"],
        extraPermissions: json["extra_permissions"],
        active: json["active"],
        hidden: json["hidden"],
        birthDate: json["birthDate"],
        citiesId: json["cities_id"],
        address: json["address"],
        gendersId: json["genders_id"],
        images: json["images"],
        verificationCode: json["verification_code"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "api_token": apiToken,
        "account_type": accountType,
        "groups_id": groupsId,
        "extra_permissions": extraPermissions,
        "active": active,
        "hidden": hidden,
        "birthDate": birthDate,
        "cities_id": citiesId,
        "address": address,
        "genders_id": gendersId,
        "images": images,
        "verification_code": verificationCode,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
