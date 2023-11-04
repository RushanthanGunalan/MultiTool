import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class stopW extends StatefulWidget {
  const stopW({Key? key}) : super(key: key);

  @override
  _stopWState createState() => _stopWState();
}

class _stopWState extends State<stopW> {


  late Stopwatch stopwatch;
  late Timer t;

  void handleStartStop() {
    if(stopwatch.isRunning) {
      stopwatch.stop();
    }
    else {
      stopwatch.start();
    }
  }

  //Referred from Flutter Documentation

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;

    String milliseconds = (milli % 100).toString().padLeft(2, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");

    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();

    t = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("StopWatch"),
          backgroundColor: Colors.grey,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.grey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CupertinoButton(
                    onPressed: () {
                      handleStartStop();
                    },
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                      child: Text(returnFormattedText(), style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),

                  const SizedBox(height: 15,),

                  ElevatedButton(
                    onPressed: () {
                      stopwatch.reset(); //Reset Timer
                    },
                    child: const Text("Reset", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    ),),
                  ),
                  Center(
                    child: ElevatedButton(
                      child: const Text('Dashboard'),
                      onPressed: () {
                        Navigator.push(  //Navigate to Dashboard
                        context,
                        MaterialPageRoute(builder: (context) => const Dashboard()),
                      ); },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}