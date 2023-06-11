// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

import 'User.dart';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<User>? userList;
  Support? support;

  UserData({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.userList,
    this.support,
  });
  // [1,2,3,45]
  Map<String, dynamic> dict = {"name": "udi", "lastName": "Levy"};

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        userList: json["data"] == null
            ? []
            : List<User>.from(json["data"]!.map((x) => User.fromJson(x))),
        support:
            json["support"] == null ? null : Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": userList == null
            ? []
            : List<dynamic>.from(userList!.map((x) => x.toJson())),
        "support": support?.toJson(),
      };
}
