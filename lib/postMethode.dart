// To parse this JSON data, do
//
//     final postmethode = postmethodeFromJson(jsonString);

import 'dart:convert';

Postmethode postmethodeFromJson(String str) => Postmethode.fromJson(json.decode(str));

String postmethodeToJson(Postmethode data) => json.encode(data.toJson());

class Postmethode {
  bool? success;
  Data? data;
  String? message;
  dynamic errors;

  Postmethode({
    this.success,
    this.data,
    this.message,
    this.errors,
  });

  factory Postmethode.fromJson(Map<String, dynamic> json) => Postmethode(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
    "message": message,
    "errors": errors,
  };
}

class Data {
  int? id;
  String? role;
  bool? isParent;
  bool? isPrivacy;
  dynamic lastLogin;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? uuid;
  String? firstName;
  dynamic lastName;
  String? username;
  String? mobile;
  String? email;
  dynamic image;
  dynamic otp;
  bool? isActive;
  dynamic fkCompany;
  int? createdBy;
  int? fkRole;
  List<dynamic>? groups;
  List<dynamic>? userPermissions;
  String? token;

  Data({
    this.id,
    this.role,
    this.isParent,
    this.isPrivacy,
    this.lastLogin,
    this.createdAt,
    this.updatedAt,
    this.uuid,
    this.firstName,
    this.lastName,
    this.username,
    this.mobile,
    this.email,
    this.image,
    this.otp,
    this.isActive,
    this.fkCompany,
    this.createdBy,
    this.fkRole,
    this.groups,
    this.userPermissions,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    role: json["role"],
    isParent: json["is_parent"],
    isPrivacy: json["is_privacy"],
    lastLogin: json["last_login"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    uuid: json["uuid"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    username: json["username"],
    mobile: json["mobile"],
    email: json["email"],
    image: json["image"],
    otp: json["otp"],
    isActive: json["is_active"],
    fkCompany: json["fk_company"],
    createdBy: json["created_by"],
    fkRole: json["fk_role"],
    groups: json["groups"] == null ? [] : List<dynamic>.from(json["groups"]!.map((x) => x)),
    userPermissions: json["user_permissions"] == null ? [] : List<dynamic>.from(json["user_permissions"]!.map((x) => x)),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role": role,
    "is_parent": isParent,
    "is_privacy": isPrivacy,
    "last_login": lastLogin,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "uuid": uuid,
    "first_name": firstName,
    "last_name": lastName,
    "username": username,
    "mobile": mobile,
    "email": email,
    "image": image,
    "otp": otp,
    "is_active": isActive,
    "fk_company": fkCompany,
    "created_by": createdBy,
    "fk_role": fkRole,
    "groups": groups == null ? [] : List<dynamic>.from(groups!.map((x) => x)),
    "user_permissions": userPermissions == null ? [] : List<dynamic>.from(userPermissions!.map((x) => x)),
    "token": token,
  };
}
