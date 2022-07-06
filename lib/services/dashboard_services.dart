

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sales_automation_project/configs/api_urls.dart';
import 'package:sales_automation_project/helper_services/custom_get_reques_services.dart';
import 'package:sales_automation_project/model/dashboard_model.dart';
import 'package:sales_automation_project/providers/dashboard_provider.dart';

class DashboardServices{
  Future getDashboard({required BuildContext context,required int userId})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: dashboardUrl+ '$userId', context: context);
      if(res !=null){
        DashboardModel  dashboard=DashboardModel.fromJson(res);
        Provider.of<DashboardProvider>(context,listen: false).updateDashboard(
          newDashboard: dashboard.mainDashboard
        );
        return true;
      }
      else{
        return false;
      }
    }
        catch(err){
      print("exception in dashboardService $err");
      return false;
        }
  }
}