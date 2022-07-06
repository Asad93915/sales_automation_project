

import 'package:flutter/cupertino.dart';

import '../model/area_model.dart';

class AreaProvider extends ChangeNotifier{
  List<Areas>? myArea=[];

  updateArea({List<Areas>? newArea}){
    myArea=newArea;
    notifyListeners();
  }
}