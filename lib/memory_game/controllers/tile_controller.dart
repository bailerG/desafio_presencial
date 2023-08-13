import 'package:flutter/foundation.dart';

class TileController with ChangeNotifier{
  bool show = false;

  void isClicked(){
    show = !show;
    notifyListeners();
  }


}

