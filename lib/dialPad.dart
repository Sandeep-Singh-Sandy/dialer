import "package:flutter/material.dart";
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Dialer extends StatefulWidget {
  var numsData = [];
  @override
  State createState() => _DialerState();
}

class _DialerState extends State<Dialer> {
  @override
  Widget build(BuildContext context) {
    printFnc(data) {
      if (widget.numsData.length <= 13) {
        widget.numsData.add(data);
      }
      setState(() {});
    }

    removeNums() {
      if (widget.numsData.length >= 1) {
        widget.numsData.removeLast();
        setState(() {});
      }
    }

    _startCall() async {
      var number = widget.numsData.join();
      if (number.isNotEmpty) {
        bool? res = await FlutterPhoneDirectCaller.callNumber(number);
        widget.numsData = [];

        setState(() {});
      }
    }

    return Scaffold(
        body: SafeArea(
            child: Container(
      height: MediaQuery.of(context).size.height - 100,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Container(
              alignment: Alignment.topCenter,
              width: (MediaQuery.of(context).size.width),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: MediaQuery.of(context).size.width - 50,
                    child: Text(
                      widget.numsData.length >= 1 ? widget.numsData.join() : "",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.backspace),
                      onPressed: () => removeNums(),
                    ),
                  )
                ],
              )),
          Padding(padding: EdgeInsets.only(top: 100)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(padding: EdgeInsets.only(top: 60)),
              SizedBox(
                  height: 80.0,
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed: () => printFnc(1),
                    child: Text(
                      "1",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
              SizedBox(
                  height: 80.0,
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed: () => printFnc(2),
                    child: Text(
                      "2",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
              SizedBox(
                  height: 80.0,
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed: () => printFnc(3),
                    child: Text(
                      "3",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(padding: EdgeInsets.only(top: 100)),
              SizedBox(
                  height: 80.0,
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed: () => printFnc(4),
                    child: Text(
                      "4",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
              SizedBox(
                  height: 80.0,
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed: () => printFnc(5),
                    child: Text(
                      "5",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
              SizedBox(
                  height: 80.0,
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed: () => printFnc(6),
                    child: Text(
                      "6",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(padding: EdgeInsets.only(top: 100)),
              SizedBox(
                  height: 80.0,
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed: () => printFnc(7),
                    child: Text(
                      "7",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
              SizedBox(
                  height: 80.0,
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed: () => printFnc(8),
                    child: Text(
                      "8",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
              SizedBox(
                  height: 80.0,
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed: () => printFnc(9),
                    child: Text(
                      "9",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(padding: EdgeInsets.only(top: 100)),
              SizedBox(
                  height: 80.0,
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed: () => printFnc("*"),
                    child: Text(
                      "*",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
              SizedBox(
                  height: 80.0,
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed: () => printFnc(0),
                    child: Text(
                      "0",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
              SizedBox(
                  height: 80.0,
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed: () => printFnc("#"),
                    child: Text(
                      "#",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 35)),
          SizedBox(
            width: 80,
            height: 80,
            child: IconButton(
              onPressed: () => {_startCall()},
              icon: Icon(Icons.call),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green),
                  iconColor: MaterialStatePropertyAll(Colors.white)),
            ),
          )
        ],
      ),
    )));
  }
}
