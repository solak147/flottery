import 'package:flottery/views/content.dart';
import 'package:flottery/views/history.dart';
import 'package:flottery/views/home.dart';
import 'package:flottery/views/test.dart';
import 'package:get/get.dart';

class RouteConfig {
  ///主頁面
  static final String main = "/";

  static final String history = "/history";

  static final String content = "/content";

  static final String test = "/test";

  static final String test2 = "/test2";

  static final String test3 = "/test3";

  ///別名映射頁面
  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => HomePage(title: '澳六图库')),
    GetPage(name: history, page: () => History()),
    GetPage(name: content, page: () => Content()),
    GetPage(name: test, page: () => Test()),
    GetPage(name: test2, page: () => Test2()),
    GetPage(name: test3, page: () => Test3()),
  ];
}
