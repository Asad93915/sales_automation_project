
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:sales_automation_project/helper_services/custom_snackbar.dart';

class PostRequestService{

  Future httpPostRequest({required String url,required Map body,required BuildContext context})async{
    print("post request url $url");
    try{
      var headers={
        "Content-Type":"application/json"
      };
      http.Response response=await http.post(Uri.parse(url),body: json.encode(body),headers: headers);
      print("post response status code ${response.statusCode}");
      log("post reques body ${response.body}");

      var jsonDecoded=json.decode(response.body);
      if(jsonDecoded ==null || jsonDecoded['ResultType'] !=1){
        CustomSnackBar.failedSnackBar(context: context, message: jsonDecoded['Message']);
        return null;
      }
      else
        {
          return jsonDecoded;
        }

    }
        catch(err){
      print("exception in custom post reques service $err");
    CustomSnackBar.failedSnackBar(context: context, message: "Exception===> $err");
      return null;
        }
  }
}