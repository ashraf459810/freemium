// To parse this JSON data, do
//
//     final codeCheck = codeCheckFromJson(jsonString);

import 'dart:convert';

CodeCheck codeCheckFromJson(String str) => CodeCheck.fromJson(json.decode(str));

String codeCheckToJson(CodeCheck data) => json.encode(data.toJson());

class CodeCheck {
  CodeCheck({
    this.azsvr,
    this.reason,
    this.apiToken,
  });

  String azsvr;
  dynamic reason;
  String apiToken;

  factory CodeCheck.fromJson(Map<String, dynamic> json) => CodeCheck(
        azsvr: json["AZSVR"],
        reason: json["Reason"],
        apiToken: json["api_token"],
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "Reason": reason,
        "api_token": apiToken,
      };
}
