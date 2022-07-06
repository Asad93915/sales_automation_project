

import 'package:flutter/cupertino.dart';
import 'package:sales_automation_project/model/dashboard_model.dart';

class DashboardProvider extends ChangeNotifier{
  MainDashboard? dashboard;

  updateDashboard({MainDashboard? newDashboard}){
    dashboard=newDashboard;
    notifyListeners();
  }
}