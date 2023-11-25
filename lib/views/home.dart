import 'package:flottery/controller/lottery_controller.dart';
import 'package:flottery/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;
  List<Widget> ballLst = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<LotteryController>(
        init: LotteryController(),
        builder: (controller) {
          if (controller.model.value.data != null) {
            for (var number
                in controller.model.value.data!.info!.gameResult.split(',')) {
              ballLst.add(
                Container(
                  margin: EdgeInsets.only(left: 3),
                  width: 25,
                  height: 25,
                  padding: EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("/images/number-icon-blue.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(number),
                ),
              );
            }
          }

          return DefaultTabController(
            length: 3,
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
                                  ? Color(0xFF07C160)
                                  : Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Search',
                                style: TextStyle(
                                    color: controller.tabIndex == 0
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: controller.tabIndex == 1
                                  ? Color(0xFF07C160)
                                  : Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Search',
                                style: TextStyle(
                                    color: tabIndex == 1
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                      onTap: (index) {
                        // 當Tab被點擊時的回調，index即為被選中的Tab的索引
                        print('Selected Tab Index: $index');
                        controller.tabIndex.value = index;
                      },
                    ),
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  Column(
                    children: [
                      Row(
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
                                        ? controller.model.value.data!.info!
                                            .lastOpenIssueNo
                                            .toString()
                                        : '',
                                    style: TextStyle(
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
                            margin: EdgeInsets.only(left: 24),
                            child: const Text(
                              '开奖直播',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                color: Color(0xFF07C160),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 24),
                              child: Image.asset(
                                '/images/lottery-draw.gif',
                                width: 80,
                                height: 20,
                              )),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: ballLst),
                    ],
                  ),

                  // 第二個選項卡的內容
                  Center(child: Text('Search Tab Content')),

                  // 第三個選項卡的內容
                  Center(child: Text('Settings Tab Content')),
                ],
              ),
            ),
          );
        });
  }
}
