import 'package:flutter/material.dart';
import 'package:sales_automation_project/configs/colors.dart';


class DrawerItemCard extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final Function()? onTap;
  bool selectedColor;
 DrawerItemCard({this.icon,this.text,this.onTap,this.selectedColor=false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: selectedColor?bgColor:Colors.transparent
          ),
          child: ListTile(

            leading:  Icon(icon,color: whiteColor,),
            title: Text(text!,style: TextStyle(color: whiteColor),),
            onTap: onTap,
          ),
        ),

      ],
    );
  }
}
