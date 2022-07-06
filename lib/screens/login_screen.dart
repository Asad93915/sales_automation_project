import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_automation_project/configs/colors.dart';
import 'package:sales_automation_project/helper_services/custom_loader.dart';
import 'package:sales_automation_project/helper_services/custom_snackbar.dart';
import 'package:sales_automation_project/helper_widgets/custom_button.dart';
import 'package:sales_automation_project/helper_widgets/custom_text_field.dart';
import 'package:sales_automation_project/providers/user_provider.dart';
import 'package:sales_automation_project/screens/home_screen.dart';
import 'package:sales_automation_project/services/login_api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = false;
  bool _isChecked = false;

  TextEditingController _userCont=TextEditingController(
    text: "im_amirali"
  );
  TextEditingController _passwordCont=TextEditingController(text: "786");
  FocusNode _userFocus=FocusNode();
  FocusNode _passwordFocus=FocusNode();

  _loginHandler()async{
      CustomLoader.showLoader(context: context);

      bool res=await LoginApiService().getLogin(context: context, userName: _userCont.text, password: _passwordCont.text);
      CustomLoader.hideLoader(context);
      if(res){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(
          userId: Provider.of<UserDataProvider>(context,listen: false).user!.sOID,
          
        )));
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Image.asset(
                "assets/logo.png",
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                "SALES \n AUTOMATION",
                style: TextStyle(
                  color: bgColor,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5.0,
                margin: EdgeInsets.only(top: 90.0, left: 15.0, right: 15.0),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.0, horizontal: 6.0),
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        prefixIcon: Icons.person,
                        hintText: "User Name",
                        inputAction: TextInputAction.next,
                        controller: _userCont,
                        focusNode: _userFocus,
                      ),
                      CustomTextField(
                        prefixIcon: Icons.lock,
                        hintText: "Password",
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.visiblePassword,
                        controller: _passwordCont,
                        focusNode: _passwordFocus,
                        obscureText: _isObscure,
                        suffixIcon: _isObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        onTapSuffix: () {
                          _isObscure = !_isObscure;
                          setState(() {});
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            activeColor: bgColor,
                              hoverColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
                              value: _isChecked, onChanged: (bool? value){
                            _isChecked=value!;
                            setState(() {

                            });
                          }),
                          Text("Remember Me",style: TextStyle(color: Colors.red,fontSize: 15.0,height: 2.5),)
                        ],
                      ),
                      CustomButton(
                        text: "LOGIN",
                        bgColor: bgColor,
                        textColor: whiteColor,
                        height: 45.0,
                        width: double.infinity,
                        horizntalMargin: 10.0,
                        verticalMargin: 15.0,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        onPressed: () {
                          if(_validateLogin()){
                            _loginHandler();
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  _validateLogin(){
    if(_userCont.text.isEmpty){
      CustomSnackBar.failedSnackBar(context: context, message: "Enter Valid User Name");
      _userFocus.requestFocus();
      return false;
    }
    else if(_passwordCont.text.isEmpty){
      CustomSnackBar.failedSnackBar(context: context, message: "Enter Valid Password");
      _passwordFocus.requestFocus();
      return false;
    }
    else{
      return true;
    }
  }
  bool _validateEmail(String text) {
    if (text.isEmpty) {
      return false;
    }

    if (RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text)) {
      return true;
    } else {
      return false;
    }
  }
}
