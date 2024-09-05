import 'package:flutter/material.dart';

class TimeButton extends StatelessWidget {
  const TimeButton({
    super.key,
    required this.setting,
    required this.isSetted,
  });

  final setting, isSetted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        left: 12,
        right: 12,
        bottom: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.5),
        borderRadius: BorderRadius.circular(5),
        color:
            isSetted ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Text(
        setting,
        style: TextStyle(
          color: isSetted ? Colors.red : Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
