


import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sales_automation_project/configs/api_urls.dart';
import 'package:sales_automation_project/helper_services/custom_post_request_service.dart';
import 'package:sales_automation_project/model/user_model.dart';
import 'package:sales_automation_project/providers/user_provider.dart';

class LoginApiService{
  Future getLogin({required BuildContext context, required String userName,required String password})async{
    try{
      Map _body={"UserName":userName,"Password":password};

      var res=await PostRequestService().httpPostRequest(url: loginUrl, body: _body, context: context);
      if(res!=null){
        UserResponseModel user=UserResponseModel.fromJson(res);
        Provider.of<UserDataProvider>(context,listen: false).updateUserData(
          newUser: user.data
        );
        return true;
      }
      else{
        return false;
      }
    }
        catch(err){
      print("exception in login api service ==> $err");
      return false;
        }
  }
}