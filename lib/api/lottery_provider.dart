import 'package:get/get.dart';

class LotteryProvider extends GetConnect {
  Future<Response> getLastGameRes(gameCode) => get(
        'http://13.214.27.204:57769/api/public/',
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods':
              "GET, PUT, POST, DELETE, HEAD, OPTIONS"
        },
        query: {
          'service': 'Lottery.getLatestGameResult',
          'uid': '34131269',
          'token': '8d3afe71e47123b6555256961f270e66',
          'gameCode': gameCode,
        },
      );
}
