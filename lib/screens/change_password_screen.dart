
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_automation_project/configs/colors.dart';
import 'package:sales_automation_project/helper_widgets/custom_button.dart';
import 'package:sales_automation_project/helper_widgets/custom_text_field.dart';
import 'package:sales_automation_project/model/user_model.dart';

import '../configs/text_styles.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text("Change Password",style: barStyle,),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("im_amirali",style: TextStyle(color: bgColor,fontSize: 20.0,fontWeight: FontWeight.bold),),
              SizedBox(height: 20.0,),
                CustomTextField(
                  headerText: "Old Password",
                  hintText: "******",
                  inputType: TextInputType.visiblePassword,
                  inputAction: TextInputAction.next,
                  obscureText: true,
                ),
              CustomTextField(
                headerText: "New Password",
                inputAction: TextInputAction.done,
                hintText: "******",
                inputType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              CustomButton(
                height: 45.0,
                width: double.infinity,
                textColor: Colors.white,
                onPressed: (){},
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                bgColor: bgColor,
                horizntalMargin: 12.0,
                verticalMargin: 12.0,
                text: "Apply Changes",
              )
            ],
          ),
        ),
      ),
    );
  }
}
