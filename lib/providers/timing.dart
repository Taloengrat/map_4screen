import 'package:flutter/cupertino.dart';

class Timeline with ChangeNotifier {
  bool _isPlay = false;
  String _speedTime = 'Normal';

  String get speedTime {
    return _speedTime;
  }

  bool get isPlay {
    return _isPlay;
  }

  doUpdateIsPlay() {
    _isPlay = !_isPlay;
    notifyListeners();
  }

  doUpdateSpeedTime(String newSpeed) {
    _speedTime = newSpeed;
    notifyListeners();
  }
}
