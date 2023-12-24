import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

import 'package:get/get_state_manager/src/simple/get_view.dart';

class CarouselSlide extends StatelessWidget {
  CarouselSlide({Key? key, required this.dataList, required this.didSelected})
      : super(key: key);
  final List dataList;
  final Function(int index) didSelected;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.width * 0.86 * 9 / 16,
        aspectRatio: 16 / 9,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
      ),
      items: dataList.map((element) {
        final index = dataList.indexOf(element);
        return GestureDetector(
          onTap: () => didSelected(index),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(color: Colors.transparent),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      color: Colors.primaries[
                          Random().nextInt(Colors.primaries.length)]),
                ),
                Positioned(
                  child: Text(
                    "$index",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class CarouselSlidePage extends GetView<CarouselSlidePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SliderListPage')),
      body: SafeArea(
        child: Center(
          child: CarouselSlide(
            dataList: controller.dataList,
            didSelected: (int index) {
              print("didTapped $index");
            },
          ),
        ),
      ),
    );
  }
}

class CarouselSlidePageController extends GetxController {
  final _dataList = [].obs;
  get dataList => this._dataList;

  @override
  void onInit() {
    _dataList.assignAll(Iterable<int>.generate(10).toList());
    super.onInit();
  }
}
