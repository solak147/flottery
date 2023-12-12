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

  Future<Response> getGameTopicPreview(gameCode, year, pageIndex) => get(
        'http://13.214.27.204:57769/api/public/',
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods':
              "GET, PUT, POST, DELETE, HEAD, OPTIONS"
        },
        query: {
          'service': 'Lottery.getGameTopicPreview',
          'uid': '34131269',
          'token': '8d3afe71e47123b6555256961f270e66',
          'year': year,
          'gameCode': gameCode,
          'pageIndex': pageIndex,
        },
      );

  Future<Response> getGameTopicContent(gameCode, forumId) => get(
        'http://13.214.27.204:57769/api/public/',
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods':
              "GET, PUT, POST, DELETE, HEAD, OPTIONS"
        },
        query: {
          'service': 'Lottery.getGameTopicContent',
          'uid': '34131269',
          'token': '8d3afe71e47123b6555256961f270e66',
          'issueNo': '0',
          'gameCode': gameCode,
          'forumId': forumId,
        },
      );
}
