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

  factory ResultModel.fromJson(String type, Map<String, dynamic> json) =>
      ResultModel(
        ret: json["ret"],
        data: DataModel.fromJson(type, json["data"] as Map<String, dynamic>),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "ret": ret,
        "data": data,
        "msg": msg,
      };
}

class DataModel {
  int code;
  LotteryModel? info;
  String msg;

  DataModel({
    required this.code,
    required this.info,
    required this.msg,
  });

  factory DataModel.fromJson(String type, Map<String, dynamic> json) {
    LotteryModel? model;
    switch (type) {
      case '32':
        model = LotteryModel.fromJson(json["info"] as Map<String, dynamic>);
        break;
      case '7':
        break;
    }

    return DataModel(
      code: json["code"],
      info: model,
      msg: json["msg"],
    );
  }
  Map<String, dynamic> toJson() => {
        "ret": code,
        "data": info,
        "msg": msg,
      };
}
