import 'dart:async';

import 'package:flutter/material.dart';

///代码清单 1-4
class FutureLoopTestPage extends StatefulWidget {

  const FutureLoopTestPage({Key? key}) : super(key: key);

  @override
  FutureLoopTestPageState createState() => FutureLoopTestPageState();
}

//lib/code/main_data.dart
class FutureLoopTestPageState extends State<FutureLoopTestPage> {
  ///声明变量
  Timer? _timer;
  ///记录当前的时间
  int curentTimer = 0;

  @override
  void initState() {
    super.initState();

    ///循环执行
    ///间隔1秒
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      ///自增
      curentTimer+=30;
      ///到5秒后停止
      if (curentTimer >= 5000) {
        _timer?.cancel();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    ///取消计时器
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("倒计时"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              ///层叠布局将进度与文字叠在一起
              Stack(
                ///子Widget居中
                alignment: Alignment.center,
                children: [
                  ///圆形进度
                  CircularProgressIndicator(
                    backgroundColor: Colors.red,
                    color: Colors.white,
                    ///当前指示的进度 0.0 -1.0
                    value: curentTimer / 5000,
                  ),
                  ///显示的文本
                  Text("${curentTimer~/1000}"),
                ],
              )
            ],
          )),
    );
  }
}