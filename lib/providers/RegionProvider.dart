

import 'package:flutter/cupertino.dart';

import '../model/get_region_moel.dart';

class GetRegionProvider extends ChangeNotifier{
  List<RegionList> ? myRegion=[];
  updateRegionList({List<RegionList>? newRegion}){
    myRegion=newRegion;
    notifyListeners();
  }
}