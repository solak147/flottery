import 'dart:convert';

import 'package:flottery/model/result_model.dart';

class LotteryModel {
  String lastOpenIssueNo;
  String gameResult;

  LotteryModel({
    required this.lastOpenIssueNo,
    required this.gameResult,
  });

  factory LotteryModel.fromJson(Map<String, dynamic> json) => LotteryModel(
        lastOpenIssueNo: json["lastOpenIssueNo"],
        gameResult: json["gameResult"],
      );
}
