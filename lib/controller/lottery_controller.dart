import 'dart:convert';

import 'package:flottery/model/result_model.dart';
import 'package:get/get.dart';
import 'package:flottery/api/lottery_provider.dart';

class LotteryController extends GetxController {
  LotteryProvider _provider = LotteryProvider();

  var model = ResultModel(
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
      var aa = json.decode(response.bodyString.toString())['data'];
      var bb = json.decode(response.bodyString.toString())['ret'];
      model.value = ResultModel.fromJson(
          '32', json.decode(response.bodyString.toString()));
      print(model.value);
    }
  }
}
