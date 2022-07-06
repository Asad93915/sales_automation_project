

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:sales_automation_project/helper_services/custom_snackbar.dart';
class GetRequestService{

  
  Future httpGetRequest({required String url,required BuildContext context})async{
    print("get request url $url");
    try{
      
      http.Response response=await http.get(Uri.parse(url));
      print("response status code ${response.statusCode}");
      log("get request body ${response.body}");
      
      var jsonDecoded=json.decode(response.body);
      if(response.statusCode !=200){
        CustomSnackBar.failedSnackBar(context: context, message: jsonDecoded['Message']);
        return null;
      }
      else{
        return jsonDecoded;
      }
    }
        catch(err){
      print("exception in custom get request service $err");
      CustomSnackBar.failedSnackBar(context: context, message: "Exception ====> $err");
      return null;
        }
  }
}