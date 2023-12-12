import 'dart:async';

import 'package:flottery/controller/lottery_controller.dart';
import 'package:flottery/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class History extends StatelessWidget {
  final ScrollController scroll = ScrollController();
  // 获取当前日期时间
  DateTime now = DateTime.now();

  Timer? _debounceTimer;

  History({super.key});

  @override
  Widget build(BuildContext context) {
    scroll.addListener(() {
      // 如果有定时器在运行，取消它
      if (_debounceTimer?.isActive ?? false) {
        _debounceTimer?.cancel();
      }

      // 创建一个新的定时器，在300毫秒后执行相应的操作
      _debounceTimer = Timer(Duration(milliseconds: 500), () {
        // 处理滚动事件的代码放在这里
        print((scroll.offset / 50).round());
      });
    });

    return GetX<LotteryController>(
        init: LotteryController(),
        builder: (controller) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Center(child: Text('歷史開獎')),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    print('左圖示被點擊了');
                    Get.back();
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.calendar_month),
                    onPressed: () {
                      // 在這裡處理另一個右圖示的點擊事件
                      print('另一個右圖示被點擊了');
                      Get.bottomSheet(Container(
                          height: 300,
                          color: Colors.white,
                          child: Scaffold(
                            appBar: AppBar(
                              titleTextStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              backgroundColor: Colors.white,
                              title: Center(child: Text('選擇年月')),
                              leading: GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.only(top: 18, left: 10),
                                  child: Text(
                                    '取消',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ),
                                onTap: () => Get.back(),
                              ),
                              actions: [
                                GestureDetector(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Text(
                                      '確定',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.blueAccent),
                                    ),
                                  ),
                                  onTap: () => Get.back(),
                                ),
                              ],
                            ),
                            body: ListView.builder(
                                controller: scroll,
                                itemCount: 101,
                                itemExtent: 51.0, //强制高度为50.0
                                physics:
                                    AlwaysScrollableScrollPhysics(), // 强制启用滑动
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                      title: index > 99
                                          ? Text('')
                                          : Text("$index"));
                                }),
                          )));
                    },
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50.0), // 設置上邊距的高度
                  child: Container(
                    color: const Color(0xFFF1F1F1),
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TabBar(
                      labelPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                      indicator: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        color: Colors.white, // 指示器的背景顏色
                      ),
                      tabs: [
                        Tab(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: controller.tabIndex == 0
                                  ? const Color(0xFF07C160)
                                  : Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '開獎紀錄',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: controller.tabIndex == 0
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                      onTap: (index) async {
                        // 當Tab被點擊時的回調，index即為被選中的Tab的索引
                        print('Selected Tab Index: $index');
                      },
                    ),
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  Text('124'),
                ],
              ),
            ),
          );
        });
  }
}
