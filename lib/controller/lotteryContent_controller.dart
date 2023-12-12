import 'dart:convert';

import 'package:flottery/api/lottery_provider.dart';
import 'package:flottery/model/lotteryContent_model.dart';
import 'package:flottery/model/result_model.dart';
import 'package:get/get.dart';

class LotteryContentController extends GetxController {
  LotteryProvider _provider = LotteryProvider();
  String gameCode;
  String forumId;

  LotteryContentController(this.gameCode, this.forumId);

  var model = ResultModel(
    ret: 0,
    data: null,
    msg: '',
  ).obs;

  @override
  void onReady() {
    super.onReady();
    getGameTopicContent();
  }

  getGameTopicContent() async {
    // var response = await _provider.getGameTopicContent(gameCode, forumId);
    // if (!response.status.hasError) {
    //   model.value = ResultModel.fromJsonList(
    //       json.decode(response.bodyString.toString()),
    //       LotteryContentModel.fromJsonList);
    // }
  }
}
