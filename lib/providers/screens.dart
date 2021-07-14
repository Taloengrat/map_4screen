import 'package:desktop_app/constance.dart';
import 'package:desktop_app/models/screen_model.dart';
import 'package:flutter/material.dart';

class Screens with ChangeNotifier {
  Map<int, ScreenModel> _item = {
    1: ScreenModel(
      aircaft_type: AIRCAFT_TYPE.AIRCAFT_1,
      isFullScreen: false,
    ),
    2: ScreenModel(
      aircaft_type: AIRCAFT_TYPE.AIRCAFT_2,
      isFullScreen: false,
    ),
    3: ScreenModel(
      aircaft_type: AIRCAFT_TYPE.AIRCAFT_3,
      isFullScreen: false,
    ),
    4: ScreenModel(
      aircaft_type: AIRCAFT_TYPE.AIRCAFT_4,
      isFullScreen: false,
    ),
  };

  Map<int, ScreenModel> get item {
    return _item;
  }

  ScreenModel? findById(int id) {
    return _item[id];
  }

  updateFullScreen(int idScreen) {
    print('oparate => ' + idScreen.toString());
    _item.updateAll(
      (key, value) => key == idScreen
          ? ScreenModel(
              aircaft_type: value.aircaft_type,
              isFullScreen: !value.isFullScreen!)
          : ScreenModel(
              aircaft_type: value.aircaft_type,
              isFullScreen: false,
            ),
    );
    notifyListeners();
  }

  updateDisplay({required int idScreen, required ScreenModel screenModel}) {
    _item.update(
      idScreen,
      (existValue) => existValue == screenModel ? existValue : screenModel,
    );
    notifyListeners();
  }
}
