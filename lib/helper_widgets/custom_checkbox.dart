import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_automation_project/configs/text_styles.dart';

import '../configs/colors.dart';

class CustomCheckBox extends StatefulWidget {
  final String? checkBoxText;
  CustomCheckBox({this.checkBoxText=""});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(widget.checkBoxText!,style: titleStyle),
      value: isChecked,
      onChanged: (bool? value){
        isChecked=value!;
        setState(() {});
      },

    );
  }
}