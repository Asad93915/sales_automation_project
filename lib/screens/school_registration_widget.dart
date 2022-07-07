
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sales_automation_project/configs/colors.dart';
import 'package:sales_automation_project/configs/text_styles.dart';
import 'package:sales_automation_project/helper_widgets/custom_button.dart';
import 'package:sales_automation_project/helper_widgets/custom_text_field.dart';
import 'package:sales_automation_project/providers/RegionProvider.dart';

import '../helper_widgets/custom_checkbox.dart';

class SchoolRegistrationWidget extends StatefulWidget {
  const SchoolRegistrationWidget({Key? key}) : super(key: key);

  @override
  State<SchoolRegistrationWidget> createState() => _SchoolRegistrationWidgetState();
}

class _SchoolRegistrationWidgetState extends State<SchoolRegistrationWidget> {
  File? imageFile;
  PickedFile? galleryPick;
  PickedFile? cameraPick;


  int? selectedRegion;
  @override
  void updateRegion(int value){
    selectedRegion=value;
    setState(() {});
  }

  String selectedEduction="Select Education System";
  List<String> eduList=["Primary","Middle"];
  String selectedStructure="Select Fee Structure";
  List<String> feeStructList=[" below 500","700"];
  String selectedSyllabus="Select Syallabus Selection Month";
  List<String> syllabusList=["Jan","Feb","March"];
  String selectedSession="Select Session in Start Month";
  List<String> sessionList=["april","may","june"];
  String selectedShop="Select Book Shop";
  List<String> bookShopList=["yes","No"];

  bool isSelected=false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.0,vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("School Registration Form",style: registrStyle,),
            CustomTextField(
              hintText: "School Name*",
              hintTextColor: redColor,
              inputAction: TextInputAction.next,
            ),
            CustomTextField(
              hintText: "Owner/Principle Name*",
              hintTextColor: redColor,
              inputAction: TextInputAction.next,
            ),
            CustomTextField(
              hintText: "Contact Number*",
              hintTextColor: redColor,
              inputType: TextInputType.number,
              inputAction: TextInputAction.next,

            ),
            CustomTextField(
              hintText: "Cell Number",
              inputType: TextInputType.phone,
              inputAction: TextInputAction.next,
            ),
            CustomTextField(
              hintText: "WhatsApp Number",
              inputType: TextInputType.number,
              inputAction: TextInputAction.next,
            ),
            CustomTextField(
              hintText: "Email",
              inputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
            ),
            
            Consumer<GetRegionProvider>(builder: (context,region,_){
              return Container(
                margin: EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),
                height: 45.0,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    // border: Border.all(color: Colors.black26,width: 1.5),
                    borderRadius: BorderRadius.circular(12.0)
                ),
                child: DropdownButton(
                  value: selectedRegion,
                    style: TextStyle(color: blackColor),
                    isExpanded: true,
                    underline: SizedBox(),
                    hint: Text("Select Region*",style: TextStyle(color: blackColor),),
                    items:region.myRegion!.map((item){
                      return DropdownMenuItem(
                        value: item.iD,
                        child: Text(item.name!,style: TextStyle(color: blackColor),),
                      );
                    }).toList() ,
                    onChanged: (int? newValue){
                     if(updateRegion!=null){
                       selectedRegion=newValue;
                     }
                      setState(() {});
                    }),
              );
            }),
            CustomTextField(
              hintText: "Address",
              inputAction: TextInputAction.next,
            ),
            CustomTextField(
              hintText: "Contact Person",
              inputAction: TextInputAction.next,
            ),
            CustomTextField(
              hintText: "Cell Number",
              inputAction: TextInputAction.next,
              inputType: TextInputType.phone,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),
              height: 45.0,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  // border: Border.all(color: Colors.black26,width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),),
              child: DropdownButton(
                style: TextStyle(color: blackColor),
                isExpanded: true,
                  underline: SizedBox(),
                  hint: Text(selectedEduction,style: TextStyle(color: blackColor),),
                  items: eduList.map((item){
                return DropdownMenuItem(
                  value: item,
                  child: Text(item,style: TextStyle(color: blackColor),),
                );
              }).toList(), onChanged: (String? value){
                selectedEduction=value!;
                setState(() {});
              }),
            ),
            CustomTextField(
              hintText: "Number of Branches",
              inputAction: TextInputAction.next,
            ),
            CustomTextField(
              hintText: "Number of Teachers",
              inputAction: TextInputAction.done,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),
              height: 45.0,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.black12,
                // border: Border.all(color: Colors.black26,width: 1.5),
                borderRadius: BorderRadius.circular(10.0),),
              child: DropdownButton(
                  style: TextStyle(color: blackColor),
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text(selectedStructure,style: TextStyle(color: blackColor),),
                  items: feeStructList.map((item){
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item,style: TextStyle(color: blackColor),),
                    );
                  }).toList(), onChanged: (String? value){
                selectedStructure=value!;
                setState(() {});
              }),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),
              height: 45.0,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.black12,
                // border: Border.all(color: Colors.black26,width: 1.5),
                borderRadius: BorderRadius.circular(10.0),),
              child: DropdownButton(
                  style: TextStyle(color: blackColor),
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text(selectedSyllabus,style: TextStyle(color: blackColor),),
                  items: syllabusList.map((item){
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item,style: TextStyle(color: blackColor),),
                    );
                  }).toList(), onChanged: (String? value){
                selectedSyllabus=value!;
                setState(() {});
              }),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),
              height: 45.0,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.black12,
                // border: Border.all(color: Colors.black26,width: 1.5),
                borderRadius: BorderRadius.circular(10.0),),
              child: DropdownButton(
                  style: TextStyle(color: blackColor),
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text(selectedSession,style: TextStyle(color: blackColor),),
                  items: sessionList.map((item){
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item,style: TextStyle(color: blackColor),),
                    );
                  }).toList(), onChanged: (String? value){
                selectedSession=value!;
                setState(() {});
              }),
            ),
            InkWell(
              onTap: (){
                isSelected =! isSelected;
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Select Current Publishers",style:publisherStyle),
                    Icon(isSelected==false?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up),
                  ],
                ),
              ),
            ),
           if(isSelected==true)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCheckBox(
                  checkBoxText: "Oxford",
                ),
                CustomCheckBox(
                  checkBoxText: "Gaba",
                ),
                CustomCheckBox(
                  checkBoxText: "Gohar",
                ),
                CustomCheckBox(
                  checkBoxText: "N/A",
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6.0,horizontal: 12.0),
              height: 45.0,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.black12,
                // border: Border.all(color: Colors.black26,width: 1.5),
                borderRadius: BorderRadius.circular(10.0),),
              child: DropdownButton(
                  style: TextStyle(color: blackColor),
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: Text(selectedShop,style: TextStyle(color: blackColor),),
                  items: bookShopList.map((item){
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item,style: TextStyle(color: blackColor),),
                    );
                  }).toList(), onChanged: (String? value){
                selectedShop=value!;
                setState(() {});
              }),
            ),
            InkWell(
              onTap: (){
                _getFromGallery();
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Picture",style: publisherStyle,),
                    Container(
                      padding: EdgeInsets.all(0.0),
                      child: galleryPick != null
                          ? SizedBox(
                        // height: 120.0,

                        child: Image.file(File(
                          galleryPick!.path,
                        ),height: 120.0,width: 120.0,fit: BoxFit.cover,),
                      )
                          : Icon(Icons.camera),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
              child: Text("Your Location",style: publisherStyle,),
            ),
            CustomTextField(
              hintText: "Remarks",
              inputAction: TextInputAction.done,
            ),
            CustomButton(
              bgColor: bgColor,
              text: "Submit",
              textColor: whiteColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w800,
              width: double.infinity,
              verticalMargin: 20.0,
              horizntalMargin: 40.0,
            )
          ],
        ),
      ),
    );
  }
  // void _getFromGallery()async{
  //
  //   galleryPick=await ImagePicker().getImage(source: ImageSource.gallery);
  //   if(galleryPick==null){
  //     setState(() {
  //       imageFile=File(galleryPick!.path);
  //     });
  //   }
  // }
  _getFromGallery() async {
    galleryPick = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (galleryPick != null) {
      setState(() {
        imageFile = File(galleryPick!.path);
      });
    }
  }
}

