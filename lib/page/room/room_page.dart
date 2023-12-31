

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'room_controller.dart';

class TestRoomPage extends StatefulWidget {

  final int roomIndex;
  final String roomInfo;

  const TestRoomPage(this.roomIndex,this.roomInfo, {Key? key}) : super(key: key);

  @override
  TestRoomPageState createState() => TestRoomPageState();

}

class TestRoomPageState extends State<TestRoomPage> {

  RoomController? controller;


  @override
  void initState() {
    log("Room initState:${widget.roomIndex}");
    controller = RoomController(widget.roomIndex);
    super.initState();
    controller?.initState();
  }


  @override
  void dispose() {
    log("Room dispose:${widget.roomIndex}");
    controller?.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("Room build:${widget.roomIndex}");
    return Container(
      width: MediaQuery.of(context).devicePixelRatio.w,
      height: 400,
      color: Colors.greenAccent,
      child: Column(
        children: [
          Text("RoomIndex:${widget.roomIndex}"),
          Text("RoomInfo:${widget.roomInfo}"),
        ],
      ),
    );
  }

}
