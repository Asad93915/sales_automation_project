

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sales_automation_project/configs/api_urls.dart';
import 'package:sales_automation_project/helper_services/custom_get_reques_services.dart';
import 'package:sales_automation_project/model/daily_activity_list.dart';

import '../providers/daily_activity_provider.dart';

class DailyActivityService extends ChangeNotifier{
  Future getActivity({required BuildContext context})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: dailyActivityUrl, context: context);
      if(res!=null){
        DailyActivityModel myActivity=DailyActivityModel.fromJson(res);
        Provider.of<DailyActivityProvider>(context,listen: false).updateDailyActivity(
          newDailyActivity: myActivity.dayInOutList
        );
        return true;
      }
      else{
        return false;
      }
    }
        catch(err){
      print("exception in daily activity service $err");
      return false;
        }
  }
}