import 'dart:convert';

import 'package:flottery/model/result_model.dart';

class LotteryModel {
  String lastOpenIssueNo;

  LotteryModel({
    required this.lastOpenIssueNo,
  });

  factory LotteryModel.fromJson(Map<String, dynamic> json) => LotteryModel(
        lastOpenIssueNo: json["lastOpenIssueNo"],
      );
}
