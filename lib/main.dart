import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const DefaultTabController(
          length: 3,
          child: MyHomePage(title: '澳六图库'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text(widget.title)),
        leading: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            print('左圖示被點擊了');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // 在這裡處理另一個右圖示的點擊事件
              print('另一個右圖示被點擊了');
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
                      color: tabIndex == 0 ? Color(0xFF07C160) : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Search',
                        style: TextStyle(
                            color: tabIndex == 0 ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: tabIndex == 1 ? Color(0xFF07C160) : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Search',
                        style: TextStyle(
                            color: tabIndex == 1 ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
              onTap: (index) {
                // 當Tab被點擊時的回調，index即為被選中的Tab的索引
                print('Selected Tab Index: $index');

                setState(() {
                  tabIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      body: const TabBarView(
        children: [
          // 第一個選項卡的內容
          Center(child: Text('Home Tab Content')),

          // 第二個選項卡的內容
          Center(child: Text('Search Tab Content')),

          // 第三個選項卡的內容
          Center(child: Text('Settings Tab Content')),
        ],
      ),
    );
  }
}
