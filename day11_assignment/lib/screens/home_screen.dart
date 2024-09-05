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

  // 초기값은 25분
  int totalSeconds = twentyFive;

  // 초 포맷
  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 70,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                'POMOTIMER',
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
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
            Flexible(
              flex: 3,
              child: Container(),
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
