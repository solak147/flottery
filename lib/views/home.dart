import 'dart:math';

import 'package:flottery/model/lotteryPreview_model.dart';
import 'package:flottery/model/lottery_model.dart';
import 'package:flottery/model/result_model.dart';
import 'package:flottery/utils/commonWiget.dart';
import 'package:flottery/controller/lottery_controller.dart';
import 'package:flottery/router.dart';
import 'package:flottery/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;

  final rnd = Random();
  late List<int> extents;
  int crossAxisCount = 2;

  @override
  void initState() {
    super.initState();
    extents = List<int>.generate(10000, (int index) => rnd.nextInt(5) + 1);
  }

  // 在3秒后执行的操作
  void delayedAction() {
    // 使用Future.delayed函数来创建一个延迟的Future
    Future.delayed(Duration(seconds: 3), () {
      // 这里写需要在3秒后执行的代码
      print('操作在3秒后执行了！');
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetX<LotteryController>(
        init: LotteryController(),
        builder: (controller) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Center(child: Text(widget.title)),
                leading: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    print('左圖示被點擊了');
                    Get.toNamed(RouteConfig.history);
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      // 在這裡處理另一個右圖示的點擊事件
                      print('另一個右圖示被點擊了');
                      Get.toNamed(RouteConfig.test);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      // 在這裡處理另一個右圖示的點擊事件
                      print('另一個右圖示被點擊了');
                      Get.toNamed(RouteConfig.test2);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      // 在這裡處理另一個右圖示的點擊事件
                      print('另一個右圖示被點擊了');
                      Get.toNamed(RouteConfig.test3);
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
                              child: Column(
                                children: [
                                  Text(
                                    controller.lotteryTab[0]['name'].toString(),
                                    style: TextStyle(
                                        color: controller.tabIndex == 0
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                  Text(
                                    Common.dateMDFmt(
                                      controller.lotteryTab[0]['openDate']
                                          .toString(),
                                    ),
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: controller.tabIndex == 0
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: controller.tabIndex == 1
                                  ? const Color(0xFF07C160)
                                  : Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    controller.lotteryTab[1]['name'].toString(),
                                    style: TextStyle(
                                        color: controller.tabIndex == 1
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                  Text(
                                    Common.dateMDFmt(
                                      controller.lotteryTab[1]['openDate']
                                          .toString(),
                                    ),
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: controller.tabIndex == 1
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                      onTap: (index) async {
                        // 當Tab被點擊時的回調，index即為被選中的Tab的索引
                        print('Selected Tab Index: $index');
                        controller.tabIndex.value = index;
                        controller.previewModel.value =
                            ResultModel(ret: 0, data: null, msg: '');
                        await controller.getGameTopicPreview(controller
                            .lotteryTab[controller.tabIndex.value]['code']);

                        await controller.getLastGameResByType(controller
                            .lotteryTab[controller.tabIndex.value]['code']);
                      },
                    ),
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  LotteryTabContent(),
                  LotteryTabContent(),
                ],
              ),
            ),
          );
        });
  }
}

class LotteryTabContent extends StatelessWidget {
  LotteryController controller = Get.find();
  List<Widget> ballLst = [];
  List<Widget> fiveLst = [];

  @override
  Widget build(BuildContext context) {
    Future<void> onRefresh() async {
      await controller.getGameTopicPreview(
          controller.lotteryTab[controller.tabIndex.value]['code']);
    }

    ballLst.clear();
    fiveLst.clear();
    if (controller.model.value.data != null) {
      for (var number
          in controller.model.value.data!.info!.gameResult.split(',')) {
        if (ballLst.length == 6) {
          break;
        }

        ballLst.add(
          Container(
            margin: const EdgeInsets.only(left: 3, right: 3),
            width: 35,
            height: 35,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "/images/number-icon-${Common.getBallColor(number)}.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(number.padLeft(2, "0")),
          ),
        );
      }

      ballLst.add(const Text(
        '+',
        textAlign: TextAlign.center,
      ));

      ballLst.add(
        Container(
          margin: const EdgeInsets.only(left: 3),
          width: 35,
          height: 35,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "/images/number-icon-${Common.getBallColor(controller.model.value.data!.info!.gameResult.split(',')[6])}.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(controller.model.value.data!.info!.gameResult
              .split(',')[6]
              .padLeft(2, "0")),
        ),
      );

      for (int i = 0; i < 6; i++) {
        fiveLst.add(
          Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                "${controller.model.value.data!.info!.gameZodiacName.split(',')[i]}/${controller.model.value.data!.info!.gameElementalName.split(',')[i]}",
                style: const TextStyle(fontSize: 10),
              )),
        );
      }

      //五行
      fiveLst.add(
        Container(
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.all(8),
            child: Text(
              "${controller.model.value.data!.info!.gameZodiacName.split(',')[6]}/${controller.model.value.data!.info!.gameElementalName.split(',')[6]}",
              style: const TextStyle(fontSize: 10), // 设置字体大小为 24),
            )),
      );
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: '第',
                  children: <InlineSpan>[
                    WidgetSpan(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 0.0),
                      child: Text(
                        controller.model.value.data != null
                            ? controller.model.value.data!.info!.lastOpenIssueNo
                                .toString()
                            : '',
                        style: const TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Color(0xFF07C160),
                        ),
                      ),
                    )),
                    const TextSpan(
                      text: '期最新开奖结果',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 24),
                child: const Text(
                  '开奖直播',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Color(0xFF07C160),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 24),
                  child: Image.asset(
                    '/images/lottery-draw.gif',
                    width: 80,
                    height: 20,
                  )),
            ],
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: ballLst),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: fiveLst),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  controller.model.value.data == null
                      ? ""
                      : "第${controller.model.value.data!.info!.nextIssueNo}期 ${Common.dateDetailFmt(controller.model.value.data!.info!.nextBetTimeE.toString())}",
                  style: const TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    color: Color(0xFFFFA500),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => Get.toNamed(RouteConfig.history),
                  child: Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(right: 10),
                    child: const Text(
                      "歷史紀錄",
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF07C160),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
        Container(
          color: const Color(0xFFF1F1F1), // 灰色背景
          height: 10, // 高度可以根据需要调整
          // 你的其他内容放在这里
        ),
        RefreshIndicator(
          onRefresh: onRefresh,
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 6.2 / 10,
              child: Waterfall()),
        ),
      ],
    );
  }
}

class Waterfall extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  Waterfall({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LotteryController>(
        init: LotteryController(),
        builder: (controller) {
          _scrollController.addListener(() {
            if (_scrollController.position.pixels ==
                _scrollController.position.maxScrollExtent) {
              controller.previewModel.value.data!.info.add(LotteryPreivewModel(
                  name: '124',
                  latestGallery: '223444',
                  imageHeight: '921',
                  imageWidth: '621',
                  imageUrl:
                      'http:\/\/static.qiye6008.com\/sys-upload\/gallery\/z\/2023297\/d-344\/A1783.jpg'));
              controller.update();
              if (controller.previewModel.value.data!.info != null) {
                print(controller.previewModel.value.data!.info);
              }
            }
          });
          return controller.previewModel.value.data == null
              ? Container(
                  width: 40.0,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: Colors.black54,
                  ))
              : MasonryGridView.count(
                  controller: _scrollController,
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemCount: controller.previewModel.value.data!.info.length,
                  itemBuilder: (context, index) {
                    final height = (double.parse(controller.previewModel.value
                                .data!.info[index].imageHeight) /
                            double.parse(controller.previewModel.value.data!
                                .info[index].imageWidth)) *
                        100;

                    return GestureDetector(
                      child: ImageTile(
                        imageUrl: controller
                            .previewModel.value.data!.info[index].imageUrl,
                        index: index,
                        width: 100,
                        height: height,
                      ),
                      onTap: () => Get.toNamed(RouteConfig.content, arguments: {
                        'code': controller.lotteryTab[controller.tabIndex.value]
                            ['code'],
                        'forumId': controller
                            .previewModel.value.data!.info[index].latestGallery
                      }),
                    );
                  },
                );
        });
  }
}
