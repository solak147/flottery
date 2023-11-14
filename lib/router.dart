import 'package:flottery/pages/history.dart';
import 'package:flottery/pages/home.dart';
import 'package:get/get.dart';

class RouteConfig {
  ///主頁面
  static final String main = "/";

  static final String history = "/history";

  ///別名映射頁面
  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => HomePage(title: '澳六图库')),
    GetPage(name: history, page: () => History()),
  ];
}
