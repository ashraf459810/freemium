// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  Token({
    this.azsvr,
    this.apiToken,
  });

  String azsvr;
  String apiToken;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        azsvr: json["AZSVR"],
        apiToken: json["api_token"],
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "api_token": apiToken,
      };
}
