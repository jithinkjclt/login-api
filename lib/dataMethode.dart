// To parse this JSON data, do
//
//     final methodeData = methodeDataFromJson(jsonString);

import 'dart:convert';

MethodeData methodeDataFromJson(String str) => MethodeData.fromJson(json.decode(str));

String methodeDataToJson(MethodeData data) => json.encode(data.toJson());

class MethodeData {
  bool? success;
  Data? data;
  String? message;
  dynamic errors;

  MethodeData({
    this.success,
    this.data,
    this.message,
    this.errors,
  });

  factory MethodeData.fromJson(Map<String, dynamic> json) => MethodeData(
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
  List<Lead>? leads;
  int? totalCount;
  int? totalPage;
  int? nextPageNo;
  dynamic previousPageNo;
  int? currentPage;

  Data({
    this.leads,
    this.totalCount,
    this.totalPage,
    this.nextPageNo,
    this.previousPageNo,
    this.currentPage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    leads: json["leads"] == null ? [] : List<Lead>.from(json["leads"]!.map((x) => Lead.fromJson(x))),
    totalCount: json["total_count"],
    totalPage: json["total_page"],
    nextPageNo: json["next_page_no"],
    previousPageNo: json["previous_page_no"],
    currentPage: json["current_page"],
  );

  Map<String, dynamic> toJson() => {
    "leads": leads == null ? [] : List<dynamic>.from(leads!.map((x) => x.toJson())),
    "total_count": totalCount,
    "total_page": totalPage,
    "next_page_no": nextPageNo,
    "previous_page_no": previousPageNo,
    "current_page": currentPage,
  };
}

class Lead {
  int? id;
  String? assignedUser;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? mobile;
  String? email;
  dynamic image;
  String? interest;
  bool? isAssigned;
  String? subSource;
  int? fkCompany;
  int? createdBy;

  Lead({
    this.id,
    this.assignedUser,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.mobile,
    this.email,
    this.image,
    this.interest,
    this.isAssigned,
    this.subSource,
    this.fkCompany,
    this.createdBy,
  });

  factory Lead.fromJson(Map<String, dynamic> json) => Lead(
    id: json["id"],
    assignedUser: json["assigned_user"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    image: json["image"],
    interest: json["interest"],
    isAssigned: json["is_assigned"],
    subSource: json["sub_source"],
    fkCompany: json["fk_company"],
    createdBy: json["created_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "assigned_user": assignedUser,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "name": name,
    "mobile": mobile,
    "email": email,
    "image": image,
    "interest": interest,
    "is_assigned": isAssigned,
    "sub_source": subSource,
    "fk_company": fkCompany,
    "created_by": createdBy,
  };
}
