
import 'package:flutter/cupertino.dart';

import '../model/daily_activity_list.dart';

class DailyActivityProvider extends ChangeNotifier{
  List<DayInOutList>? dailyActivity=[];
  updateDailyActivity({List<DayInOutList>? newDailyActivity}){
    dailyActivity=newDailyActivity;
    notifyListeners();
  }
}