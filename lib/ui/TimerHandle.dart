import 'package:flutter/material.dart';
import 'dart:async';

class TimerHandle extends StatefulWidget {
  const TimerHandle({Key? key}) : super(key: key);

  // create instance of state class
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<TimerHandle> {
  // used to CTOW used to keep track of seconds, watch string is shown to user
  int currentTimeOnWatch = 0;
  String watchString = '00:00';
  // ignore: unused_field
  late Timer _timer;

  // run on load
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  //udpates the timer once per second, formats string
  void updateTimer() {
    currentTimeOnWatch += 1;

    int minI = (currentTimeOnWatch / 60).truncate();
    int secI = currentTimeOnWatch - (60 * minI);

    // format min and second
    late String minS;
    late String secS;
    (minI < 10) ? (minS = '0''$minI') : (minS = '$minI');
    (secI < 10) ? (secS = '0''$secI') : (secS = '$secI');

    // change display value
    watchString = '$minS:$secS';
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
    return Text(watchString);
  }
}
