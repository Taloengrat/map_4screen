import 'package:desktop_app/providers/timing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerOption extends StatefulWidget {
  PlayerOption({Key? key}) : super(key: key);

  @override
  _PlayerOptionState createState() => _PlayerOptionState();
}

class _PlayerOptionState extends State<PlayerOption> {
  @override
  Widget build(BuildContext context) {
    final isPlay = Provider.of<Timeline>(context).isPlay;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () => doPlayAction(),
          child: Icon(
            isPlay ? Icons.pause_rounded : Icons.play_arrow_rounded,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.replay_10_rounded,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.forward_10_rounded,
          ),
        ),
        Text(
          'TIME CURRENT',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  doPlayAction() {
    Provider.of<Timeline>(context, listen: false).doUpdateIsPlay();
  }
}
