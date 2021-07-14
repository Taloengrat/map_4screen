import 'package:desktop_app/components/speed_menu_popup_component.dart';
import 'package:desktop_app/widgets/player_option_widget.dart';
import 'package:desktop_app/widgets/timeline_slider.dart';
import 'package:flutter/material.dart';

class BottomTimelinePanel extends StatelessWidget {
  const BottomTimelinePanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
          child: PlayerOption(),
        ),
        Expanded(
          flex: 12,
          child: TimelineSlider(),
        ),
        Flexible(
          child: SpeedMenuPopupComponent(),
        ),
        SizedBox(
          width: 14,
        ),
        Flexible(
          child: Text(
            'TIME ALL',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
