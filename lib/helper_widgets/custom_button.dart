import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String? text;
  final Function? onPressed;
  final double? height;
  final double? width;
  final Color? bgColor;
  final Color? textColor;
  final double horizntalMargin;
  final double verticalMargin;
  final double fontSize;
  final FontWeight? fontWeight;

  const CustomButton({
    this.text = '',
    this.onPressed,
    this.height = 45.0,
    this.width = 100.0,
    this.bgColor = Colors.blue,
    this.textColor = Colors.black54, this.horizntalMargin=10.0, this.verticalMargin=10.0, this.fontSize=16.0, this.fontWeight=FontWeight.normal,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}


class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: widget.verticalMargin,horizontal: widget.horizntalMargin),
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: widget.bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
        onPressed: () {
          setState(() {});
          widget.onPressed!();
        },
        child: Text(
          widget.text!,
          style: TextStyle(color: widget.textColor, fontSize: widget.fontSize,fontWeight: widget.fontWeight),
        ),
      ),
    );
  }
}