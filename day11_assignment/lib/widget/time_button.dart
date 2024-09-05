import 'package:flutter/material.dart';

class TimeButton extends StatefulWidget {
  const TimeButton({
    super.key,
    required this.setting,
    required this.settingSeconds,
    required this.settedButton,
  });

  final setting, settingSeconds, settedButton;

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
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
        color: widget.settingSeconds == widget.settedButton
            ? Colors.white
            : Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Text(
        widget.setting,
        style: TextStyle(
          color: widget.settingSeconds == widget.settedButton
              ? Colors.red
              : Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
