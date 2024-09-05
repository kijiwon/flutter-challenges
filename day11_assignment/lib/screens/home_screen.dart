import 'dart:async';

import 'package:day11_assignment/widget/timeButton.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const fifteen = 900;
  static const twenty = 1200;
  static const twentyFive = 1500;
  static const thirty = 1800;
  static const thirtyFive = 2100;
  late Timer timer;
  bool isRunning = false;

  // 초기값은 25분
  int totalSeconds = twentyFive;
  // 유저가 누른 시간
  int settingSeconds = twentyFive;
  // 버튼
  int settingButton = twentyFive;

  // 초 포맷
  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 7);
  }

  // time setting
  void onTimePressed(int settedTime) {
    timer.cancel();
    setState(() {
      totalSeconds = settedTime;
      settingSeconds = settedTime;
      isRunning = false;
    });
  }

  void onTick(Timer timer) {
    setState(() {
      totalSeconds--;
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 70,
          right: 10,
          left: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'POMOTIMER',
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 180,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        format(totalSeconds).substring(0, 2),
                        style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: 60,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: const Text(
                        ':',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 161, 154),
                            fontSize: 55,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      height: 180,
                      width: 120,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        format(totalSeconds).substring(3, 5),
                        style: TextStyle(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontSize: 60,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Flexible(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () => onTimePressed(fifteen),
                        child: TimeButton(
                          setting: '15',
                          settingSeconds: settingButton,
                          settedButton: fifteen,
                        ),
                      ),
                      TextButton(
                        onPressed: () => onTimePressed(twenty),
                        child: TimeButton(
                          setting: '20',
                          settingSeconds: settingSeconds,
                          settedButton: twenty,
                        ),
                      ),
                      TextButton(
                        onPressed: () => onTimePressed(twentyFive),
                        child: TimeButton(
                          setting: '25',
                          settingSeconds: settingSeconds,
                          settedButton: twentyFive,
                        ),
                      ),
                      TextButton(
                        onPressed: () => onTimePressed(thirty),
                        child: TimeButton(
                          setting: '30',
                          settingSeconds: settingSeconds,
                          settedButton: thirty,
                        ),
                      ),
                      TextButton(
                        onPressed: () => onTimePressed(thirtyFive),
                        child: TimeButton(
                          setting: '35',
                          settingSeconds: settingSeconds,
                          settedButton: thirtyFive,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(
                      isRunning ? Icons.pause : Icons.play_arrow_rounded,
                    ),
                    color: Colors.white,
                    iconSize: 80,
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
