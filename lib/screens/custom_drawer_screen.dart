import 'package:flutter/material.dart';
import 'package:sales_automation_project/configs/colors.dart';
import 'package:sales_automation_project/configs/text_styles.dart';
import 'package:sales_automation_project/helper_services/navigation_services.dart';
import 'package:sales_automation_project/helper_widgets/drawer_item_card.dart';

import 'package:sales_automation_project/screens/login_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * .75,
    color: bgColor,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 12.0,right: 12.0,top: 35.0,bottom: 35.0),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image.asset("assets/logo.png",height: 40.0,width: 40.0,),
                Text("SALES\nAUTOMATION",style:salesStyle,textAlign: TextAlign.center,),
              ],
            ),
          ),
          Container(

            padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 15.0),
            decoration: BoxDecoration(
              color: bgColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerItemCard(
                  selectedColor: selectedIndex==0? true :false,
                  icon: Icons.dashboard,
                  text: "Dashboard",
                  onTap: (){
                    selectedIndex=0;
                    setState(() {
                      // NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: HomeScreen());
                    });
                  },
                ),
                Container(width: double.infinity,height: 1.0,color: whiteColor,),
                DrawerItemCard(
                  selectedColor: selectedIndex==1? true :false,
                  icon: Icons.dashboard,
                  text: "Online Attendance",
                  onTap: (){
                    selectedIndex=1;
                    setState(() {
                      // NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: HomeScreen());
                    });
                  },

                ),
                Container(width: double.infinity,height: 1.0,color: whiteColor,),
                DrawerItemCard(
                  selectedColor: selectedIndex==2? true :false,
                  icon: Icons.dashboard,
                  text: "School Registration",
                  onTap: (){
                    selectedIndex=2;
                    setState(() {
                      // NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: HomeScreen());
                    });
                  },
                ),
                Container(width: double.infinity,height: 1.0,color: whiteColor,),
                DrawerItemCard(
                  selectedColor: selectedIndex==3? true :false,
                  icon: Icons.dashboard,
                  text: "Update School",
                  onTap: (){
                    selectedIndex=3;
                    setState(() {
                      // NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: HomeScreen());
                    });
                  },
                ),
                Container(width: double.infinity,height: 1.0,color: whiteColor,),
                DrawerItemCard(
                  selectedColor: selectedIndex==4? true :false,
                  icon: Icons.dashboard,
                  text: "Online Visits",
                  onTap: (){
                    selectedIndex=4;
                    setState(() {
                      // NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: HomeScreen());
                    });
                  },

                ),
                Container(width: double.infinity,height: 1.0,color: whiteColor,),
                DrawerItemCard(
                  selectedColor: selectedIndex==5? true :false,
                  icon: Icons.dashboard,
                  text: "Offline Visits",
                  onTap: (){
                    selectedIndex=5;
                    setState(() {
                      // NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: HomeScreen());
                    });
                  },
                ),
                Container(width: double.infinity,height: 1.0,color: whiteColor,),
                DrawerItemCard(
                  selectedColor: selectedIndex==6? true :false,
                  icon: Icons.dashboard,
                  text: "My Visits",
                  onTap: (){
                    selectedIndex=6;
                    setState(() {
                      // NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: HomeScreen());
                    });
                  },

                ),
                Container(width: double.infinity,height: 1.0,color: whiteColor,),
                DrawerItemCard(
                  selectedColor: selectedIndex==7? true :false,
                  icon: Icons.dashboard,
                  text: "Logout",
                  onTap: (){
                    selectedIndex=7;
                    setState(() {
                      NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: LoginScreen());
                    });
                  },

                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
