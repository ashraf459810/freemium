// To parse this JSON data, do
//
//     final requestHistory = requestHistoryFromJson(jsonString);

import 'dart:convert';

RequestHistory requestHistoryFromJson(String str) =>
    RequestHistory.fromJson(json.decode(str));

String requestHistoryToJson(RequestHistory data) => json.encode(data.toJson());

class RequestHistory {
  RequestHistory({
    this.azsvr,
    this.orders,
  });

  String azsvr;
  List<Order> orders;

  factory RequestHistory.fromJson(Map<String, dynamic> json) => RequestHistory(
        azsvr: json["AZSVR"],
        orders: List<Order>.from(json["Orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "Orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    this.id,
    this.usersId,
    this.apartmentsId,
    this.providersId,
    this.servicesId,
    this.statusesId,
    this.attributes,
    this.price,
    this.isPaid,
    this.feedback,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.provider,
    this.service,
    this.apartment,
    this.status,
  });

  int id;
  int usersId;
  int apartmentsId;
  int providersId;
  int servicesId;
  int statusesId;
  String attributes;
  int price;
  int isPaid;
  dynamic feedback;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  dynamic provider;
  dynamic service;
  Apartment apartment;
  Status status;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        usersId: json["users_id"],
        apartmentsId: json["apartments_id"],
        providersId: json["providers_id"],
        servicesId: json["services_id"],
        statusesId: json["statuses_id"],
        attributes: json["attributes"],
        price: json["price"],
        isPaid: json["isPaid"],
        feedback: json["feedback"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        provider: json["provider"],
        service: json["service"],
        apartment: Apartment.fromJson(json["apartment"]),
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "users_id": usersId,
        "apartments_id": apartmentsId,
        "providers_id": providersId,
        "services_id": servicesId,
        "statuses_id": statusesId,
        "attributes": attributes,
        "price": price,
        "isPaid": isPaid,
        "feedback": feedback,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "provider": provider,
        "service": service,
        "apartment": apartment.toJson(),
        "status": status.toJson(),
      };
}

class Apartment {
  Apartment({
    this.id,
    this.number,
    this.floorNumber,
    this.buildingsId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int number;
  int floorNumber;
  int buildingsId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Apartment.fromJson(Map<String, dynamic> json) => Apartment(
        id: json["id"],
        number: json["number"],
        floorNumber: json["floor_number"],
        buildingsId: json["buildings_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "floor_number": floorNumber,
        "buildings_id": buildingsId,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Status {
  Status({
    this.id,
    this.name,
    this.color,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String color;
  dynamic createdAt;
  dynamic updatedAt;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
