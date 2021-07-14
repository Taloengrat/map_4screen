import 'package:desktop_app/constance.dart';
import 'package:desktop_app/constance.dart';
import 'package:desktop_app/providers/timing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpeedMenuPopupComponent extends StatefulWidget {
  const SpeedMenuPopupComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<SpeedMenuPopupComponent> createState() =>
      _SpeedMenuPopupComponentState();
}

class _SpeedMenuPopupComponentState extends State<SpeedMenuPopupComponent> {
  @override
  Widget build(BuildContext context) {
    final speed = Provider.of<Timeline>(context).speedTime;

    print('speed $speed');
    return PopupMenuButton(
      tooltip: 'current speed $speed',
      itemBuilder: (context) {
        var list = <PopupMenuEntry<dynamic>>[];
        list.add(
          PopupMenuItem(
            child: InkWell(
              onTap: () => doUpdateSpeed(SPEED_125),
              child: ListTile(
                leading: speed == SPEED_125
                    ? Icon(Icons.check)
                    : SizedBox(
                        width: 10,
                      ),
                title: Text(SPEED_125),
              ),
            ),
          ),
        );
        list.add(
          PopupMenuItem(
            child: InkWell(
              onTap: () => doUpdateSpeed(SPEED_NORMAL),
              child: ListTile(
                leading: speed == SPEED_NORMAL
                    ? Icon(Icons.check)
                    : SizedBox(
                        width: 10,
                      ),
                title: Text(SPEED_NORMAL),
              ),
            ),
          ),
        );
        list.add(
          PopupMenuItem(
            child: InkWell(
              onTap: () => doUpdateSpeed(SPEED_075),
              child: ListTile(
                leading: speed == SPEED_075
                    ? Icon(Icons.check)
                    : SizedBox(
                        width: 10,
                      ),
                title: Text(SPEED_075),
              ),
            ),
          ),
        );

        return list;
      },
      child: Icon(Icons.slow_motion_video_rounded),
    );
  }

  doUpdateSpeed(String speed) {
    Provider.of<Timeline>(context, listen: false).doUpdateSpeedTime(speed);
    Navigator.of(context).pop();
  }
}
