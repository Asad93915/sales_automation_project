

import 'package:flutter/cupertino.dart';
import 'package:sales_automation_project/model/user_model.dart';

class UserDataProvider extends ChangeNotifier{
  UserModel? user;
  updateUserData({UserModel ? newUser}){
    user=newUser;
    notifyListeners();
  }
}