import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sales_automation_project/helper_services/custom_loader.dart';
import 'package:sales_automation_project/helper_widgets/custom_button.dart';
import 'package:sales_automation_project/helper_widgets/custom_text_field.dart';
import 'package:sales_automation_project/providers/RegionProvider.dart';
import 'package:sales_automation_project/providers/area_provider.dart';
import 'package:sales_automation_project/providers/daily_activity_provider.dart';
import 'package:sales_automation_project/providers/get_cities_provider.dart';
import 'package:sales_automation_project/providers/user_provider.dart';
import 'package:sales_automation_project/services/daily_activity_service.dart';
import 'package:sales_automation_project/services/get_region-services.dart';
import 'package:sales_automation_project/services/mark_attendance_service.dart';

import '../configs/colors.dart';
import '../helper_services/custom_get_reques_services.dart';

class MarkAttendanceWidget extends StatefulWidget {
  const MarkAttendanceWidget({Key? key}) : super(key: key);

  @override
  State<MarkAttendanceWidget> createState() => _MarkAttendanceWidgetState();
}

class _MarkAttendanceWidgetState extends State<MarkAttendanceWidget> {

  bool isActivity=false;
  bool isZone=false;


  // _getDailyActivity()async{
  //   CustomLoader.showLoader(context: context);
  //
  //   CustomLoader.hideLoader(context);
  // }
  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     _getDailyActivity();
  //   });
  //   super.initState();
  // }



  int? selectedActivity;
  @override
  void updateDailyActivity(int value){
    setState(() {
      selectedActivity = value;

      isActivity=true;
    });
  }
  int? selectedRegion;
  @override
  void updateRegion(int value){
    setState(() {
      selectedRegion = value;
      isZone=true;
    });
  }
  int? selectedCity;
  @override
  void updateCity(int value){
    selectedCity=value;
    setState(() {
    });
  }
  int? selectedArea;
@override
void updateArea(int? value){
  selectedArea=value;
  setState(() {
  });
}
  _attendanceHandler()async{

    CustomLoader.showLoader(context: context);
    await MarkAttendanceService().markAttendance(context: context,
        userId: Provider.of<UserDataProvider>(context,listen: false).user!.sOID!,
        activityId: selectedActivity!,
        regionId: selectedRegion!,
        cityId: selectedCity!,
        areaId: selectedArea!);
    CustomLoader.hideLoader(context);

  }

  @override
  Widget build(BuildContext context) {

      return Card(
        elevation: 10.0,
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<DailyActivityProvider>(builder: (context,activity,_){
                return  Container(
                  margin: EdgeInsets.symmetric(vertical: 12.0),
                  height: 45.0,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(color: Colors.black26,width: 1.5),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: DropdownButton (
                    borderRadius: BorderRadius.circular(12.0),
                    hint: Text("Select Daily Activity",
                      style: TextStyle(
                          color: blackColor

                      ),
                    ),
                    value: selectedActivity,
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down,),
                    underline:SizedBox() ,
                    onChanged: (int? newValue) {

                      if(updateDailyActivity != null){
                        updateDailyActivity(newValue!);
                      }
                      print("Upadate Daily Activity $selectedActivity");
                    },

                    items: activity.dailyActivity!.map((item) =>
                        DropdownMenuItem(
                            value: item.iD,
                            child: Text(item.value!,
                              style: TextStyle(
                                // color: AppColors.black,
                                // fontFamily: Assets.gilroyMedium,
                                // fontSize: sizes.largeFontSizeA,
                              ),)
                        )
                    ).toList(),
                  ),
                );
              }),
              if(isActivity==true)
               Consumer<GetRegionProvider>(builder: (context,region,_){
                 return  Container(
                   margin: EdgeInsets.symmetric(vertical: 12.0),
                   height: 45.0,
                   padding: EdgeInsets.symmetric(horizontal: 10.0),
                   decoration: BoxDecoration(
                       color: Colors.black12,
                       border: Border.all(color: Colors.black26,width: 1.5),
                       borderRadius: BorderRadius.circular(10.0)),
                   child: DropdownButton(
                       isExpanded: true,
                       underline: SizedBox(),
                       hint: Text("Select Zone", style: TextStyle(
                           color: blackColor

                       ),),
                       value: selectedRegion,
                       items:region.myRegion!.map((item) {
                         return DropdownMenuItem(
                           value: item.iD,
                           child: Text(item.name!),
                         );
                       }).toList() ,
                       onChanged: (int? newValue){
                         if(updateRegion!=null){
                           updateRegion(newValue!);
                           setState(() {
                           });
                         }
                     setState(() {});
                   }),
                 );
               }),
              if(isZone==true)
                Consumer<GetCitiesProvider>(builder: (context,city,_){
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 12.0),
                    height: 45.0,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        border: Border.all(color: Colors.black26,width: 1.5),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        hint: Text("",style: TextStyle(color: Colors.black),),
                        value: selectedCity,
                        items:city.myCity!.map((item){
                          return DropdownMenuItem(
                            value: item.iD,
                            child: Text(item.name!),
                          );
                        }).toList() ,
                        onChanged: (int? newValue){
                          if(updateCity!=null){
                            updateCity(newValue!);
                            setState(() {});
                          }
                      setState(() {
                      });
                    }),
                  );
                }),
              if(isZone==true)
              Consumer<AreaProvider>(builder: (context,area,_){
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 12.0),
                  height: 45.0,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(color: Colors.black26,width: 1.5),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      hint: Text("",style: TextStyle(color: blackColor),),
                      value: selectedArea,
                      items: area.myArea!.map((item){
                        return DropdownMenuItem(
                          value: item.iD,
                          child: Text(item.name!),
                        );
                      }).toList(),
                      onChanged: (int? newValue){
                       if(updateArea!=null){
                         updateArea(newValue!);
                         setState(() {
                         });
                       }
                        setState(() {});
                      }),
                );
              }),
              CustomButton(
                onPressed: (){
                  _attendanceHandler();
                  setState(() {});
                },
                height: 45.0,
                text: "MARK ATTENDANCE",
                width: double.infinity,
                bgColor: bgColor,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                 horizntalMargin: 2.0,
                verticalMargin: 12.0,
                textColor: whiteColor,
              )
            ],
          ),
        ),
      );
  }

}