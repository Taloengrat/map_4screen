import 'package:desktop_app/constance.dart';

class ScreenModel {
  late AIRCAFT_TYPE aircaft_type;
  bool? isFullScreen = false;

  ScreenModel({
    required this.aircaft_type,
    this.isFullScreen,
  });

  bool get IsFullScreen {
    return isFullScreen!;
  }

  AIRCAFT_TYPE get getAircaftType {
    return aircaft_type;
  }

  void set setAircaft(AIRCAFT_TYPE aircaft_type) {
    this.aircaft_type = aircaft_type;
  }

  void set setFullScreen(bool isFullScreen) {
    this.isFullScreen = isFullScreen;
  }
}
