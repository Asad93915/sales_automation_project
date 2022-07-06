
import 'package:flutter/cupertino.dart';

import '../model/get_cities_model.dart';

class GetCitiesProvider extends ChangeNotifier{
  List<Cities>? myCity=[];
  updateCities({List<Cities>?newCities}){
    myCity=newCities;
    notifyListeners();
  }
}