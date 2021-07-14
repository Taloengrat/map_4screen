import 'package:desktop_app/constance.dart';
import 'package:desktop_app/models/screen_model.dart';
import 'package:desktop_app/providers/screens.dart';
import 'package:desktop_app/widgets/text_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AircaftMenuPopupComponent extends StatefulWidget {
  final Widget child;
  final int idScreen;

  AircaftMenuPopupComponent({
    Key? key,
    required this.child,
    required this.idScreen,
  }) : super(key: key);

  @override
  _AircaftMenuPopupComponentState createState() =>
      _AircaftMenuPopupComponentState();
}

class _AircaftMenuPopupComponentState extends State<AircaftMenuPopupComponent> {
  @override
  Widget build(BuildContext context) {
    final screenValue = Provider.of<Screens>(context).findById(widget.idScreen);
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: PopupMenuButton(
          onSelected: (value) =>
              screenValue!.getAircaftType != value as AIRCAFT_TYPE
                  ? doUpdateDisplay(value as AIRCAFT_TYPE, widget.idScreen)
                  : {},
          child: TextTitleWidget(
              title: getAircaftType(screenValue!.getAircaftType)),
          offset: Offset(0, 30),
          itemBuilder: (context) {
            var list = <PopupMenuEntry<AIRCAFT_TYPE>>[];

            list.add(PopupMenuItem(
                value: AIRCAFT_TYPE.AIRCAFT_1,
                child: TextTitleWidget(
                  title: listAircaft.elementAt(0),
                )));
            list.add(PopupMenuItem(
                value: AIRCAFT_TYPE.AIRCAFT_2,
                child: TextTitleWidget(
                  title: listAircaft.elementAt(1),
                )));
            list.add(PopupMenuItem(
                value: AIRCAFT_TYPE.AIRCAFT_3,
                child: TextTitleWidget(
                  title: listAircaft.elementAt(2),
                )));
            list.add(PopupMenuItem(
                value: AIRCAFT_TYPE.AIRCAFT_4,
                child: TextTitleWidget(
                  title: listAircaft.elementAt(3),
                )));

            return list;
          }),
    );
  }

  doUpdateDisplay(AIRCAFT_TYPE value, int idScreen) {
    print(value);

    Provider.of<Screens>(context, listen: false).updateDisplay(
        idScreen: idScreen,
        screenModel: ScreenModel(aircaft_type: value, isFullScreen: false));
  }

  String getAircaftType(AIRCAFT_TYPE aircaft_type) {
    if (aircaft_type == AIRCAFT_TYPE.AIRCAFT_1) return listAircaft.elementAt(0);
    if (aircaft_type == AIRCAFT_TYPE.AIRCAFT_2) return listAircaft.elementAt(1);
    if (aircaft_type == AIRCAFT_TYPE.AIRCAFT_3) return listAircaft.elementAt(2);
    if (aircaft_type == AIRCAFT_TYPE.AIRCAFT_4) return listAircaft.elementAt(3);

    return 'invalid';
  }
}
