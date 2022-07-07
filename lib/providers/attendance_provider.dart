
import 'package:flutter/cupertino.dart';
import 'package:sales_automation_project/model/mark_attandace_model.dart';

class MarkAttendanceProvider  extends ChangeNotifier{
  MarkAttendaceModel? attendance;
  updateAttendance({MarkAttendaceModel? newAttendance}){
    attendance=newAttendance;
    notifyListeners();
  }
}