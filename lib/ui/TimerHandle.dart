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
  late Timer _timer;

  // run on load
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  //udpates the timer once per second, formats string
  void updateTimer() {
    currentTimeOnWatch -= 1;
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      setState(() {
        updateTimer();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          returnTimeString(currentTimeOnWatch),
          style: const TextStyle(fontSize: 28.0, fontWeight: FontWeight.w900),
        ),
        const Text('TEMP', style: TextStyle(fontSize: 15.0)), //TODO: should update based on task
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TODO: select better icons
            IconButton(
              icon: const Icon(Icons.play_arrow),
              iconSize: 55.0,
              onPressed: () {
                setState(() {
                  //TODO: stop start the timer
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.pause),
              iconSize: 55.0,
              onPressed: () {
                setState(() {
                  //TODO: stop the timer
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.skip_next),
              iconSize: 55.0,
              onPressed: () {
                setState(() {
                  //TODO: stop the timer
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
