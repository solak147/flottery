import 'dart:convert';

import 'package:flottery/model/lottery_model.dart';

class ResultModel {
  int ret;
  DataModel? data;
  String msg;

  ResultModel({
    required this.ret,
    required this.data,
    required this.msg,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json,
          Function(Map<String, dynamic>) fromJsonT) =>
      ResultModel(
        ret: json["ret"],
        data:
            DataModel.fromJson(json["data"] as Map<String, dynamic>, fromJsonT),
        msg: json["msg"],
      );

  factory ResultModel.fromJsonList(
          Map<String, dynamic> json, Function(List) fromJsonT) =>
      ResultModel(
        ret: json["ret"],
        data: DataModel.fromJsonList(
            json["data"] as Map<String, dynamic>, fromJsonT),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "ret": ret,
        "data": data,
        "msg": msg,
      };
}

class DataModel<T> {
  int code;
  T? info;
  String msg;

  DataModel({
    required this.code,
    required this.info,
    required this.msg,
  });

  factory DataModel.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    T? model;
    model = fromJsonT(json["info"] as Map<String, dynamic>);
    return DataModel(
      code: json["code"],
      info: model,
      msg: json["msg"],
    );
  }

  factory DataModel.fromJsonList(
      Map<String, dynamic> jsons, T Function(List) fromJsonT) {
    T? model;
    model = fromJsonT(jsons["info"]);
    return DataModel(
      code: jsons["code"],
      info: model,
      msg: jsons["msg"],
    );
  }

  Map<String, dynamic> toJson() => {
        "ret": code,
        "data": info,
        "msg": msg,
      };
}
