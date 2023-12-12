import 'dart:convert';

import 'package:flottery/model/result_model.dart';

class LotteryContentModel {
  String gameTurn;
  String thumbUrl;

  LotteryContentModel({
    required this.gameTurn,
    required this.thumbUrl,
  });

  factory LotteryContentModel.fromJson(Map<String, dynamic> json) =>
      LotteryContentModel(
        gameTurn: json["gameTurn"],
        thumbUrl: json["thumbUrl"],
      );

  static List<LotteryContentModel> fromJsonList(List lst) =>
      List<LotteryContentModel>.from(
          lst.map((x) => LotteryContentModel.fromJson(x)));
}
