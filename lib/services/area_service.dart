
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sales_automation_project/configs/api_urls.dart';
import 'package:sales_automation_project/helper_services/custom_get_reques_services.dart';
import 'package:sales_automation_project/model/area_model.dart';
import 'package:sales_automation_project/providers/area_provider.dart';


class AreaService extends ChangeNotifier{
  Future getArea({required BuildContext context,required int cityId,required int soId})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: areaUrl + "${"CityID=$cityId&SOID=$soId"}", context: context);
      if(res !=null){
        AreaModel area=AreaModel.fromJson(res);
        Provider.of<AreaProvider>(context,listen: false).updateArea(
          newArea: area.areas
        );
        return true;
      }
      else{
        return false;
      }
    }
        catch(err){
      print("exception in area service $err");
      return false;
        }
  }
}