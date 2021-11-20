// To parse this JSON data, do
//
//     final services = servicesFromJson(jsonString);

import 'dart:convert';

Services servicesFromJson(String str) => Services.fromJson(json.decode(str));

String servicesToJson(Services data) => json.encode(data.toJson());

class Services {
  Services({
    this.azsvr,
    this.communities,
  });

  String azsvr;
  List<Community> communities;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        azsvr: json["AZSVR"],
        communities: List<Community>.from(
            json["Communities"].map((x) => Community.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "AZSVR": azsvr,
        "Communities": List<dynamic>.from(communities.map((x) => x.toJson())),
      };
}

class Community {
  Community({
    this.id,
    this.name,
    this.address,
    this.citiesId,
    this.logo,
    this.workingHoursFrom,
    this.workingHoursTo,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.providers,
    this.buildings,
  });

  int id;
  String name;
  String address;
  int citiesId;
  String logo;
  String workingHoursFrom;
  String workingHoursTo;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  List<Provider> providers;
  List<Building> buildings;

  factory Community.fromJson(Map<String, dynamic> json) => Community(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        citiesId: json["cities_id"],
        logo: json["logo"],
        workingHoursFrom: json["working_hours_from"],
        workingHoursTo: json["working_hours_to"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        providers: List<Provider>.from(
            json["providers"].map((x) => Provider.fromJson(x))),
        buildings: List<Building>.from(
            json["buildings"].map((x) => Building.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "cities_id": citiesId,
        "logo": logo,
        "working_hours_from": workingHoursFrom,
        "working_hours_to": workingHoursTo,
        "phone": phone,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "providers": List<dynamic>.from(providers.map((x) => x.toJson())),
        "buildings": List<dynamic>.from(buildings.map((x) => x.toJson())),
      };
}

class Building {
  Building({
    this.id,
    this.name,
    this.numFloor,
    this.numApartments,
    this.communitiesId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.managers,
  });

  int id;
  String name;
  int numFloor;
  int numApartments;
  int communitiesId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  List<Manager> managers;

  factory Building.fromJson(Map<String, dynamic> json) => Building(
        id: json["id"],
        name: json["name"],
        numFloor: json["num_floor"],
        numApartments: json["num_apartments"],
        communitiesId: json["communities_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        managers: List<Manager>.from(
            json["managers"].map((x) => Manager.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "num_floor": numFloor,
        "num_apartments": numApartments,
        "communities_id": communitiesId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "managers": List<dynamic>.from(managers.map((x) => x.toJson())),
      };
}

class Manager {
  Manager({
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
    this.pivot,
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
  dynamic citiesId;
  dynamic address;
  dynamic gendersId;
  dynamic images;
  dynamic verificationCode;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  ManagerPivot pivot;

  factory Manager.fromJson(Map<String, dynamic> json) => Manager(
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        pivot: ManagerPivot.fromJson(json["pivot"]),
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "pivot": pivot.toJson(),
      };
}

class ManagerPivot {
  ManagerPivot({
    this.buildingsId,
    this.userId,
  });

  int buildingsId;
  int userId;

  factory ManagerPivot.fromJson(Map<String, dynamic> json) => ManagerPivot(
        buildingsId: json["buildings_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "buildings_id": buildingsId,
        "user_id": userId,
      };
}

class Provider {
  Provider({
    this.id,
    this.companyName,
    this.logo,
    this.phone,
    this.address,
    this.citiesId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.pivot,
    this.services,
  });

  int id;
  String companyName;
  String logo;
  String phone;
  String address;
  int citiesId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  ProviderPivot pivot;
  List<Service> services;

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json["id"],
        companyName: json["company_name"],
        logo: json["logo"],
        phone: json["phone"],
        address: json["address"],
        citiesId: json["cities_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        pivot: ProviderPivot.fromJson(json["pivot"]),
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_name": companyName,
        "logo": logo,
        "phone": phone,
        "address": address,
        "cities_id": citiesId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "pivot": pivot.toJson(),
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
      };
}

class ProviderPivot {
  ProviderPivot({
    this.communitiesId,
    this.providersId,
  });

  int communitiesId;
  int providersId;

  factory ProviderPivot.fromJson(Map<String, dynamic> json) => ProviderPivot(
        communitiesId: json["communities_id"],
        providersId: json["providers_id"],
      );

  Map<String, dynamic> toJson() => {
        "communities_id": communitiesId,
        "providers_id": providersId,
      };
}

class Service {
  Service({
    this.id,
    this.serviceName,
    this.description,
    this.workingHoursFrom,
    this.workingHoursTo,
    this.priceForm,
    this.priceTo,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.pivot,
    this.attribs,
  });

  int id;
  String serviceName;
  String description;
  String workingHoursFrom;
  String workingHoursTo;
  String priceForm;
  String priceTo;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  ServicePivot pivot;
  List<Attrib> attribs;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        serviceName: json["service_name"],
        description: json["description"],
        workingHoursFrom: json["working_hours_from"],
        workingHoursTo: json["working_hours_to"],
        priceForm: json["price_form"],
        priceTo: json["price_to"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        pivot: ServicePivot.fromJson(json["pivot"]),
        attribs:
            List<Attrib>.from(json["attribs"].map((x) => Attrib.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "service_name": serviceName,
        "description": description,
        "working_hours_from": workingHoursFrom,
        "working_hours_to": workingHoursTo,
        "price_form": priceForm,
        "price_to": priceTo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "pivot": pivot.toJson(),
        "attribs": List<dynamic>.from(attribs.map((x) => x.toJson())),
      };
}

class Attrib {
  Attrib({
    this.id,
    this.servicesId,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int servicesId;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Attrib.fromJson(Map<String, dynamic> json) => Attrib(
        id: json["id"],
        servicesId: json["services_id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "services_id": servicesId,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

class ServicePivot {
  ServicePivot({
    this.providersId,
    this.servicesId,
  });

  int providersId;
  int servicesId;

  factory ServicePivot.fromJson(Map<String, dynamic> json) => ServicePivot(
        providersId: json["providers_id"],
        servicesId: json["services_id"],
      );

  Map<String, dynamic> toJson() => {
        "providers_id": providersId,
        "services_id": servicesId,
      };
}
