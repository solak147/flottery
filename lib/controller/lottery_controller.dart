import 'package:flottery/model/lottery_model.dart';
import 'package:get/get.dart';
import 'package:flottery/api/lottery_provider.dart';

class LotteryController extends GetxController {
  LotteryProvider _provider = LotteryProvider();

  var model = {}.obs;

  @override
  void onReady() {
    super.onReady();
    getLastGameRes();
  }

  getLastGameRes() async {
    var response = await _provider.getLastGameRes('32');
    if (!response.status.hasError) {
      model.value = postModelFromJson2(response.bodyString.toString());
      print(model);
    }
  }
}
