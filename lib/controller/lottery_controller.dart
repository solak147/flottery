import 'dart:convert';

import 'package:flottery/model/lotteryPreview_model.dart';
import 'package:flottery/model/lottery_model.dart';
import 'package:flottery/model/result_model.dart';
import 'package:get/get.dart';
import 'package:flottery/api/lottery_provider.dart';

class LotteryController extends GetxController {
  LotteryProvider _provider = LotteryProvider();

  var lotteryTab = [
    {'name': '澳彩', 'code': '32', 'openDate': ''},
    {'name': '港彩', 'code': '7', 'openDate': ''}
  ].obs;

  var model = ResultModel(
    ret: 0,
    data: null,
    msg: '',
  ).obs;

  var previewModel = ResultModel(
    ret: 0,
    data: null,
    msg: '',
  ).obs;

  var tabIndex = 0.obs;

  @override
  void onReady() {
    super.onReady();
    getLastGameRes();
    getGameTopicPreview(lotteryTab[0]['code']);
  }

  getLastGameRes() async {
    String auDate = "";
    String hkDate = "";
    var response = await _provider.getLastGameRes('32');
    if (!response.status.hasError) {
      model.value = ResultModel.fromJson('32',
          json.decode(response.bodyString.toString()), LotteryModel.fromJson);
      auDate = model.value.data!.info!.nextBetTimeE.toString();
    }

    response = await _provider.getLastGameRes('7');
    if (!response.status.hasError) {
      var model = ResultModel.fromJson('7',
          json.decode(response.bodyString.toString()), LotteryModel.fromJson);
      hkDate = model.data!.info!.nextBetTimeE.toString();
    }

    lotteryTab.value = [
      {'name': '澳彩', 'code': '32', 'openDate': auDate},
      {'name': '港彩', 'code': '7', 'openDate': hkDate}
    ];
  }

  getLastGameResByType(type) async {
    var response = await _provider.getLastGameRes(type);
    if (!response.status.hasError) {
      model.value = ResultModel.fromJson(type,
          json.decode(response.bodyString.toString()), LotteryModel.fromJson);
    }
  }

  getGameTopicPreview(type) async {
    var response = await _provider.getGameTopicPreview(type, '2023', '0');
    if (!response.status.hasError) {
      // previewModel.value = ResultModel.fromJsonList(
      //     type,
      //     json.decode(
      //         '{"ret":200,"data":{"code":0,"msg":"","info":[{"groupId":"2540","name":"\u32a3\u6fb3\u95e8\u65b0\u7248\u8dd1\u72d7","gameTurn":"2023297","imageUrl":"http:\/\/static.qiye6008.com\/sys-upload\/gallery\/z\/2023297\/d-344\/A1783.jpg","latestGallery":"121981","isNew":"0","playCategoryId":"32","sort":"9996","companyId":"1,2,3","updatedAt":"2023-10-06 08:00:00","updatedTime":"1696550400","imageWidth":"664","imageHeight":"1017"},{"groupId":"2540","name":"\u32a3\u6fb3\u95e8\u65b0\u7248\u8dd1\u72d7","gameTurn":"2023297","imageUrl":"http:\/\/static.qiye6008.com\/sys-upload\/gallery\/z\/2023297\/d-344\/A1783.jpg","latestGallery":"121981","isNew":"0","playCategoryId":"32","sort":"9996","companyId":"1,2,3","updatedAt":"2023-10-06 08:00:00","updatedTime":"1696550400","imageWidth":"664","imageHeight":"1017"},{"groupId":"2540","name":"\u32a3\u6fb3\u95e8\u65b0\u7248\u8dd1\u72d7","gameTurn":"2023297","imageUrl":"http:\/\/static.qiye6008.com\/sys-upload\/gallery\/z\/2023297\/d-344\/A1783.jpg","latestGallery":"121981","isNew":"0","playCategoryId":"32","sort":"9996","companyId":"1,2,3","updatedAt":"2023-10-06 08:00:00","updatedTime":"1696550400","imageWidth":"664","imageHeight":"1017"},{"groupId":"2540","name":"\u32a3\u6fb3\u95e8\u65b0\u7248\u8dd1\u72d7","gameTurn":"2023297","imageUrl":"http:\/\/static.qiye6008.com\/sys-upload\/gallery\/z\/2023297\/d-344\/A1783.jpg","latestGallery":"121981","isNew":"0","playCategoryId":"32","sort":"9996","companyId":"1,2,3","updatedAt":"2023-10-06 08:00:00","updatedTime":"1696550400","imageWidth":"664","imageHeight":"1017"},{"groupId":"2540","name":"\u32a3\u6fb3\u95e8\u65b0\u7248\u8dd1\u72d7","gameTurn":"2023297","imageUrl":"http:\/\/static.qiye6008.com\/sys-upload\/gallery\/z\/2023297\/d-344\/A1783.jpg","latestGallery":"121981","isNew":"0","playCategoryId":"32","sort":"9996","companyId":"1,2,3","updatedAt":"2023-10-06 08:00:00","updatedTime":"1696550400","imageWidth":"664","imageHeight":"1017"},{"groupId":"2641","name":"\u32a3\u7ba1\u5bb6\u5a46\u4e00\u53e5\u8bddC","gameTurn":"2023297","imageUrl":"http:\/\/static.qiye6008.com\/sys-upload\/gallery\/z\/2023297\/d-344\/A1748.jpg","latestGallery":"121947","isNew":"0","playCategoryId":"32","sort":"9994","companyId":"1,2,3","updatedAt":"2023-10-06 08:00:00","updatedTime":"1696550400","imageWidth":"929","imageHeight":"621"}]},"msg":""}'),
      //     LotteryPreivewModel.previewModelFromJson);

      previewModel.value = ResultModel.fromJsonList(
          '32',
          json.decode(response.bodyString.toString()),
          LotteryPreivewModel.previewModelFromJson);
      print(response.bodyString.toString());
    }
  }
}
