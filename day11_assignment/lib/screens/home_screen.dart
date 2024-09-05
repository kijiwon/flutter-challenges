import 'dart:async';

import 'package:day11_assignment/widget/time_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer timer;
  static const fifteen = 900;
  static const twenty = 1200;
  static const twentyFive = 1500;
  static const thirty = 1800;
  static const thirtyFive = 2100;
  bool isRunning = false;
  int totalRounds = 0;
  int totalGoals = 0;

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
    if (totalSeconds == 0) {
      setState(() {
        totalRounds++;
        isRunning = false;
        totalSeconds = settingSeconds;
      });
      if (totalRounds == 2) {
        setState(() {
          totalGoals++;
          totalRounds = 0;
        });
      }
      timer.cancel();
    } else {
      setState(() {
        totalSeconds--;
      });
    }
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
          right: 35,
          left: 35,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'POMOTIMER',
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              flex: 2,
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
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
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 53, 52, 52)
                            .withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                      onPressed: isRunning ? onPausePressed : onStartPressed,
                      icon: Icon(
                        isRunning ? Icons.pause : Icons.play_arrow_rounded,
                      ),
                      color: Colors.white,
                      iconSize: 80,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '$totalRounds/2',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      const Text(
                        'ROUND',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '$totalGoals/4',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      const Text(
                        'GOAL',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
