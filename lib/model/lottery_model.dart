import 'dart:convert';

List<LotteryModel> postModelFromJson(String str) => List<LotteryModel>.from(
    json.decode(str).map((x) => LotteryModel.fromJson(x)));

Map<dynamic, dynamic> postModelFromJson2(String str) =>
    Map<dynamic, dynamic>.from(json.decode(str));

String postModelToJson(List<LotteryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LotteryModel {
  int ret;
  var data;
  String msg;

  LotteryModel({
    required this.ret,
    required this.data,
    required this.msg,
  });

  factory LotteryModel.fromJson(Map<String, dynamic> json) => LotteryModel(
        ret: json["ret"],
        data: json["data"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "ret": ret,
        "data": data,
        "msg": msg,
      };
}
