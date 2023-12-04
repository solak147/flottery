import 'dart:convert';

import 'package:flottery/model/result_model.dart';
import 'package:get/get.dart';
import 'package:flottery/api/lottery_provider.dart';

class LotteryController extends GetxController {
  LotteryProvider _provider = LotteryProvider();

  var lotteryTab = [
    {'name': '澳彩', 'code': '32', 'openDate': ''},
    {'name': '港彩', 'code': '7', 'openDate': ''}
  ];

  var model = ResultModel(
    ret: 0,
    data: null,
    msg: '',
  ).obs;

  var model2 = ResultModel(
    ret: 0,
    data: null,
    msg: '',
  ).obs;

  var tabIndex = 0.obs;

  @override
  void onReady() {
    super.onReady();
    getLastGameRes();
  }

  getLastGameRes() async {
    var response = await _provider.getLastGameRes('32');
    if (!response.status.hasError) {
      model.value = ResultModel.fromJson(
          '32', json.decode(response.bodyString.toString()));
      lotteryTab[0]['openDate'] =
          model.value.data!.info!.nextBetTimeE.toString();
      print(model.value);
    }

    response = await _provider.getLastGameRes('7');
    if (!response.status.hasError) {
      model2.value = ResultModel.fromJson(
          '7', json.decode(response.bodyString.toString()));
      lotteryTab[1]['openDate'] =
          model2.value.data!.info!.nextBetTimeE.toString();
      print(model);
    }
  }
}
