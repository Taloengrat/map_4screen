import 'package:flutter/material.dart';

class TimelineSlider extends StatefulWidget {
  const TimelineSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<TimelineSlider> createState() => _TimelineSliderState();
}

class _TimelineSliderState extends State<TimelineSlider> {
  double timeValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: timeValue,
      onChanged: (newValue) => setState(() => timeValue = newValue),
      max: 1000,
      min: 0,
      activeColor: Colors.black,
      inactiveColor: Colors.black26,
      // label: '$timeValue',
      // divisions: 1000,
    );
  }
}
