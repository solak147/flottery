import 'dart:convert';

import 'package:flottery/model/result_model.dart';

class LotteryModel {
  String lastOpenIssueNo;
  String gameResult;
  String gameZodiacName;
  String gameElementalName;
  String nextIssueNo;
  int nextBetTimeE;

  LotteryModel({
    required this.lastOpenIssueNo,
    required this.gameResult,
    required this.gameZodiacName,
    required this.gameElementalName,
    required this.nextIssueNo,
    required this.nextBetTimeE,
  });

  factory LotteryModel.fromJson(Map<String, dynamic> json) => LotteryModel(
        lastOpenIssueNo: json["lastOpenIssueNo"],
        gameResult: json["gameResult"],
        gameZodiacName: json["gameZodiacName"],
        gameElementalName: json["gameElementalName"],
        nextIssueNo: json["nextIssueNo"],
        nextBetTimeE: json["nextBetTimeE"],
      );
}
