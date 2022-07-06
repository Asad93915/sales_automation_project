
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sales_automation_project/helper_services/custom_get_reques_services.dart';
import 'package:sales_automation_project/model/get_cities_model.dart';

import '../configs/api_urls.dart';
import '../providers/get_cities_provider.dart';

class GetCitiesService{
  Future getCity({required BuildContext context,required int regionId})async{
    try{

      var res=await GetRequestService().httpGetRequest(url: getCitiesUrl + "$regionId", context: context);
      if(res !=null){
        GetCitiesModel myCity=GetCitiesModel.fromJson(res);
        Provider.of<GetCitiesProvider>(context,listen: false).updateCities(
          newCities: myCity.cities
        );
        return true;
      }
      else{
        return false;
      }
    }
        catch(err){
      print("exception in getCitiesService $err");
      return false;
        }
  }
}