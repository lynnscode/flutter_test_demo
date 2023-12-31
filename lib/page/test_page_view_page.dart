import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test_demo/custom_view/dl_custom_page_view_scroll_physics.dart';
import 'package:flutter_test_demo/custom_view/dl_page_view.dart';

import 'room/room_page.dart';

class TestPageViewPage extends StatefulWidget {

  const TestPageViewPage({Key? key}) : super(key: key);

  @override
  TestPageViewPageState createState() => TestPageViewPageState();

}

class TestPageViewPageState extends State<TestPageViewPage> {

  List<String> list = ["Page1", "Page2", "Page3", "Page4", "Page5"];

  PageController pageController = PageController(initialPage: 0);

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("TestPageViewPage"),
      ),
      body: PageView.builder(
          itemCount: list.length,
          scrollDirection: Axis.vertical,
          // allowImplicitScrolling: true,
          physics: const BouncingScrollPhysics(),
          controller: pageController,
          onPageChanged: (index){
          },
          itemBuilder: (BuildContext context, int index) {
            log('itemBuilder index:$index');
            String name = list[index];
            return TestRoomPage(index,name);
          }),
    );
  }

}
