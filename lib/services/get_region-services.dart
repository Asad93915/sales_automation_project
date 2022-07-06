

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sales_automation_project/configs/api_urls.dart';
import 'package:sales_automation_project/helper_services/custom_get_reques_services.dart';

import 'package:sales_automation_project/model/get_region_moel.dart';
import 'package:sales_automation_project/providers/RegionProvider.dart';

class GetRegionServices{
  Future getRegion({required BuildContext context,required int userId})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: getRegionUrl + "$userId", context: context);
      if(res!=null){
        GetRegionModel myRegion=GetRegionModel.fromJson(res);
        Provider.of<GetRegionProvider>(context,listen: false).updateRegionList(
          newRegion: myRegion.regionList
        );
        return true;
      }
      else{
        return false;
      }

    }
        catch(err){
      print("exception in getRegion Service $err");
      return false;
        }
  }
}