import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;

int startTime = 500;
int currentTimeOnWatch = 500;

class TimerHandle extends StatefulWidget {
  const TimerHandle({Key? key}) : super(key: key);

  // create instance of state class
  @override
  _TimerState createState() => _TimerState();
}

//custom painter for the timer circle, draws a circle with black arc
class MyPainter extends CustomPainter {

  //logic for the arc, returns the angle of the arc
  arcLogic() {
      return (currentTimeOnWatch / startTime) * (2*math.pi);
  }

  @override
  void paint(Canvas canvas, Size size) {
  final rect = Rect.fromLTRB(0, 0, 250, 250);
  const startAngle = -(math.pi / 2);
  final sweepAngle = arcLogic();
  const useCenter = false;
  final paint = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 8;
  canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);                               
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }
}
//state class for timer
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
              width: 255.0,
              height: 255.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
            Container(
              width: 245.0,
              height: 245.0,
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
            ),
            CustomPaint(
              size: const Size(250, 250),
              painter: MyPainter(),
            ),
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
