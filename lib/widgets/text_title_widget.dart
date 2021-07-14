import 'package:desktop_app/constance.dart';
import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  final String title;
  const TextTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: defaultTitlePadding,
            horizontal: defaultTitlePadding,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black26,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
