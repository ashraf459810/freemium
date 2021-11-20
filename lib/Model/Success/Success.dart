// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

Success successfromjson(String str) => Success.fromJson(json.decode(str));

String signupModelToJson(Success data) => json.encode(data.toJson());

class Success {
  Success({
    this.azsvr,
  });

  String azsvr;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
        azsvr: json["AZSVR"],
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
      };
}
