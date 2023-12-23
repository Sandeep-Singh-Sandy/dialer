import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';
import "./dialPad.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

List<dynamic> nums = [];
getCallLogs() async {
  Iterable<CallLogEntry> entries = await CallLog.get();

  entries.forEach((element) {
    nums.add({
      "name": element.name,
      "number": element.number,
      "time": DateFormat('dd/MM/yyyy')
          .format(DateTime.fromMillisecondsSinceEpoch(element.timestamp!)),
    });
  });
  return nums;
}

class Logs extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
          "Calling",
          style: GoogleFonts.poppins(fontSize: 30),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Dialer())),
          child: Icon(Icons.dialpad),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: nums.length,
                itemBuilder: (context, index) {
                  return CallLogTile(nums[index]["name"], nums[index]['number'],
                      nums[index]['time']);
                })),
      ),
    );
  }
}

class CallLogTile extends StatelessWidget {
  final name;
  final number;
  final time;
  CallLogTile(this.name, this.number, this.time);
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(children: [
        Container(
          margin: EdgeInsets.fromLTRB(15, 30, 20, 0),
          child: CircleAvatar(
            backgroundColor: Colors.black,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: name.toString().isNotEmpty
                    ? Text(
                        name.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    : Text(
                        number.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mobile"),
                  Padding(padding: EdgeInsets.only(right: 25)),
                  Text(time.toString())
                ],
              ),
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.only(left: 60),
            child: IconButton(
                onPressed: () => print(""), icon: Icon(Icons.call_outlined)))
      ]),
    );
  }
}
