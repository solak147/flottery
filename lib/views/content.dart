import 'package:flottery/controller/lotteryContent_controller.dart';
import 'package:flottery/controller/lottery_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Content extends StatelessWidget {
  //dynamic args = Get.arguments;

  Content({super.key});

  @override
  Widget build(BuildContext context) {
    //print(args);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(child: Text('歷史開獎')),
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
            },
          ),
        ],
      ),
      body: GetX<LotteryController>(
          init: LotteryController(),
          builder: (controller) {
            return Center(
              child: Text(
                controller.tabIndex.toString(),
                style: const TextStyle(color: Colors.blue, fontSize: 15),
              ),
            );
          }),
    );
  }
}
