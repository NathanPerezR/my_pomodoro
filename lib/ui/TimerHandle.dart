import 'package:flutter/material.dart';
import 'package:my_pomodoro/ui/Themes.dart';
import 'dart:async';
import 'dart:math' as math;
import 'Themes.dart';


List<int> timerArray = [2700,300,1500,600];
int timerArrayIndex = 0;
int startTime = timerArray[0];
int currentTimeOnWatch = timerArray[0];
String task = " ";
bool isBreak = false;

class TimerHandle extends StatefulWidget {
  const TimerHandle({Key? key}) : super(key: key);

  // create instance of state class
  @override
  _TimerState createState() => _TimerState();
}

// custom painter for the timer circle, draws a circle with black arc
class CircleEverySecond extends CustomPainter {
  // logic for the arc, returns the angle of the arc
  arcLogic() {
    return (currentTimeOnWatch / startTime) * (2 * math.pi);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, 250, 250);
    const startAngle = -(math.pi / 2);
    final sweepAngle = arcLogic();
    const useCenter = false;
    final paint = Paint()
      ..color = CommonThemes().defaultTheme.colorScheme.onTertiary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }
}

// state class for timer
class _TimerState extends State<TimerHandle> {
  // returns a timer string, input seconds outputs "00:00"
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

  late Timer _timer;
  bool isRunning = false;

  // udpates the timer once per second, formats string
  void updateTimer() {
    switch (timerArrayIndex) {
      // first count down
      case 0:
        currentTimeOnWatch -= 1;
        if (currentTimeOnWatch == 0) {
          startTime = timerArray[1];
          timerArrayIndex = 1;
          isBreak = true;
        }
        break;
      // first count up
      case 1:
        currentTimeOnWatch += 1;
        if (currentTimeOnWatch == timerArray[1]) {
          startTime = currentTimeOnWatch = timerArray[2];
          timerArrayIndex = 2;
          isBreak = false;
        }
        break;
      // first count down
      case 2:
        currentTimeOnWatch -= 1;
        if (currentTimeOnWatch == 0) {
          startTime = timerArray[3];
          timerArrayIndex = 3;
          isBreak = true;
        }
        break;
      // then count up
      case 3:
        currentTimeOnWatch += 1;
        if (currentTimeOnWatch == timerArray[3]) {
          startTime = currentTimeOnWatch = timerArray[0];
          timerArrayIndex = 0;
          isBreak = false;
        }
        break;
      // once done, res
      default:
        timerArrayIndex = 0;
    }
  }

  // starts timer
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        updateTimer();
      });
    });
    isRunning = true;
  }

  // stops the timer
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
          // all elements centered
          alignment: Alignment.center,
          children: [
            Container(
              width: 255.0,
              height: 255.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CommonThemes().defaultTheme.colorScheme.background,
              ),
            ),
            Container(
              width: 245.0,
              height: 245.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CommonThemes().defaultTheme.colorScheme.onBackground,
              ),
            ),
            Column(
              children: [
                Text(
                  returnTimeString(currentTimeOnWatch),
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w800,
                    color: CommonThemes().defaultTheme.colorScheme.tertiary,
                  ),
                ),
                Text(
                  isBreak ? "BREAK" : "WORK",
                  style: TextStyle(color: CommonThemes().defaultTheme.colorScheme.tertiary.withOpacity(.7)),
                ),
              ],
            ),
            CustomPaint(
              size: const Size(250, 250),
              painter: CircleEverySecond(),
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
                  timerArrayIndex = 0;
                  currentTimeOnWatch = timerArray[0];
                  startTime = timerArray[0];
                  isBreak = false;
                  _stopTimer();
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
