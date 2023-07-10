import 'package:flutter/material.dart';
import 'dart:async';

class TimerHandle extends StatefulWidget {
  const TimerHandle({Key? key}) : super(key: key);

  // create instance of state class
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<TimerHandle> {
  
  //returns a timer string, input seconds outputs "00:00"
  String returnTimeString(secondsOnWatch) {
    int minI = (secondsOnWatch / 60).truncate();
    int secI = secondsOnWatch - (60 * minI);

    late String minS;
    late String secS;
    (minI < 10) ? (minS = '0' '$minI') : (minS = '$minI');
    (secI < 10) ? (secS = '0' '$secI') : (secS = '$secI');

    String watchString = '$minS:$secS';
    return watchString;
  }

  //TODO: remove dev statement 45 mins
  // used used to keep track of seconds
  int currentTimeOnWatch = 1500;
  String taskString = 'TASK';
  late Timer _timer;
  bool isRunning = false;

  //udpates the timer once per second, formats string
  void updateTimer() {
    currentTimeOnWatch -= 1;
  }

  //starts timer
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        updateTimer();
      });
    });
    isRunning = true;
  }

  //stops the timer
  void _stopTimer() {
    _timer.cancel();
    isRunning = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // circle with timer in the middle
        Stack(
          //all elements centered
          alignment: Alignment.center,
          children: [
            Container(
              width: 250.0,
              height: 250.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
            Container(
              width: 234.0,
              height: 234.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            Column(
              children: [
                Text(
                  returnTimeString(currentTimeOnWatch),
                  style: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                Text(
                  taskString,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            )
          ],
        ),
  
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.play_arrow),
              iconSize: 55.0,
              onPressed: () {
                if (isRunning == false) {
                  setState(() {
                    _startTimer();
                  });
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.pause),
              iconSize: 55.0,
              onPressed: () {
                if (isRunning == true) {
                  setState(() {
                    _stopTimer();
                  });
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.skip_next),
              iconSize: 55.0,
              onPressed: () {
                setState(() {
                  currentTimeOnWatch = 0;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
