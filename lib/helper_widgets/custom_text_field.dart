
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../configs/colors.dart';

class CustomTextField extends StatelessWidget {
  final String? headerText;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final bool obscureText;
  final int? length;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? onTapSuffix;
  final double horizntalMargin;
  CustomTextField({this.headerText, this.controller, this.inputType, this.inputAction, this.focusNode, this.obscureText=false, this.length, this.prefixIcon, this.suffixIcon, this.hintText, this.labelText, this.onTapSuffix, this.horizntalMargin=12.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (headerText==null? SizedBox() :Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 2.0,),
          child: Text(headerText!,style: TextStyle(color: blackColor,fontSize: 16.0,fontWeight: FontWeight.bold),),
        )),
        Container(
          margin: EdgeInsets.symmetric(horizontal: horizntalMargin,vertical: 8.0),
          height: 45.0,
          decoration: BoxDecoration(

          ),
          child: TextField(
            cursorColor: Colors.black,
            controller: controller,
            focusNode: focusNode,
            textInputAction: inputAction,
            keyboardType: inputType,
            obscureText: obscureText,
            inputFormatters: [LengthLimitingTextInputFormatter(length)],
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              hintText: hintText,
              labelText: labelText,
              fillColor: Colors.black12,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(12.0)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent,),
                  borderRadius: BorderRadius.circular(12.0)
              ),
              prefixIcon:prefixIcon==null? null :IconButton(onPressed: (){}, icon: Icon(prefixIcon,color: bgColor,size: 25.0,)),
              suffixIcon: suffixIcon==null ? null :IconButton(onPressed: onTapSuffix, icon: Icon(suffixIcon,color: bgColor,)),
            ),

          ),
        )
      ],
    );
  }
}
