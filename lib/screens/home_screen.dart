import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sales_automation_project/configs/colors.dart';
import 'dart:math' as math;

import 'package:sales_automation_project/configs/text_styles.dart';
import 'package:sales_automation_project/helper_services/custom_loader.dart';
import 'package:sales_automation_project/helper_services/navigation_services.dart';
import 'package:sales_automation_project/providers/RegionProvider.dart';
import 'package:sales_automation_project/providers/dashboard_provider.dart';
import 'package:sales_automation_project/providers/get_cities_provider.dart';
import 'package:sales_automation_project/screens/change_password_screen.dart';
import 'package:sales_automation_project/screens/custom_drawer_screen.dart';
import 'package:sales_automation_project/screens/mark_attandace_widget.dart';
import 'package:sales_automation_project/services/area_service.dart';
import 'package:sales_automation_project/services/dashboard_services.dart';

import '../model/dashboard_model.dart';
import '../services/daily_activity_service.dart';
import '../services/get_cities_service.dart';
import '../services/get_region-services.dart';

class HomeScreen extends StatefulWidget {
  final int? userId;
  const HomeScreen({Key? key, this.userId}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedIndex=0;
  void _onItemTap(int? index){
    setState(() {
      selectedIndex = index;
    });
  }
  static  List<Widget>widgetsOption=[
    _DashboardWidget(),
    MarkAttendanceWidget(),
  ];

  _getDashboard()async{
    CustomLoader.showLoader(context: context);
    await DashboardServices().getDashboard(context: context,userId: widget.userId!);
   await DailyActivityService().getActivity(context: context);
   await GetRegionServices().getRegion(context: context,userId: widget.userId!);
   await GetCitiesService().getCity(context: context,regionId: Provider.of<GetRegionProvider>(context,listen: false).myRegion![0].iD!);
   await AreaService().getArea(context: context,soId:widget.userId!,cityId: Provider.of<GetCitiesProvider>(context,listen: false).myCity![0].iD!);
    CustomLoader.hideLoader(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      _getDashboard();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bgColor,
        elevation: 4.0,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 13.0,
        unselectedFontSize: 12.0,
        // selectedItemColor: Colors.white,
        // selectedLabelStyle: TextStyle(color: Colors.white,fontSize: 12.0),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "Dashboard",
              backgroundColor: Colors.red

          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.doc),
              label: "     Mark\nAttandance",

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "     School\nRegestration",
          ),
          BottomNavigationBarItem(
              icon:Icon(CupertinoIcons.location_solid),
              label: "Visit\ndetails"
          ),

        ],
        currentIndex: selectedIndex!,
        onTap: _onItemTap,
      ),
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: Builder(builder: (context)=>IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: Icon(Icons.menu,color: whiteColor,)),),
        title: Text("Sales Automation", style: barStyle),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () {
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: ChangePasswordScreen());
              },
              icon: Icon(Icons.key_sharp),
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widgetsOption.elementAt(selectedIndex!),



    ]),
      ),

    );
  }
}
class _DashboardWidget extends StatefulWidget {
  const _DashboardWidget({Key? key}) : super(key: key);

  @override
  State<_DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<_DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          height: MediaQuery.of(context).size.height/3.2,
          decoration: BoxDecoration(
              color: Colors.black12
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Welcome to Sales Automation",style: TextStyle(color: bgColor,fontWeight: FontWeight.bold,fontSize: 22.0,height: 1.5),),
              SizedBox(height: 30.0,),
              Image.asset("assets/logo.png",height: 60.0,width: 60.0,fit: BoxFit.cover,),
              SizedBox(height: 8.0,),
              Text("SALES\nAUTOMATION",style: salesStyle,textAlign: TextAlign.center,),
              SizedBox(height: 30.0,)

            ],
          ),
        ),
        Consumer<DashboardProvider>(builder: (context,dash,_) {

          return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,

            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return TotalDetailsWidget(
                dashboard: dash.dashboard,
              );
            },
          );
          // return
          //   ListView.builder(
          //   physics: NeverScrollableScrollPhysics(),
          //     itemCount: dash.dashboard!.achivedValue!.bitLength,
          //     shrinkWrap: true,
          //     scrollDirection: Axis.vertical,
          //     itemBuilder: (BuildContext,index){
          //   return TotalDetailsWidget(
          //   dashboard: dash.dashboard!,
          //   );
          // });

        }
        ),
      ],
    );
  }
}

class TotalDetailsWidget extends StatefulWidget {
  MainDashboard? dashboard;
   TotalDetailsWidget({required this.dashboard});
  @override
  State<TotalDetailsWidget> createState() => _TotalDetailsWidgetState();
}

class _TotalDetailsWidgetState extends State<TotalDetailsWidget> {
  // List dashboardList=[
  //   DashboardModel.dashboard!.totalVisits.toString(),
  //   widget.dashboard!.totalVisits.toString(),
  //   widget.dashboard!.totalVisits.toString(),
  //   widget.dashboard!.totalVisits.toString(),
  // ];
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 22.0,vertical: 22.0),
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(

        decoration: BoxDecoration(
            color: bgColor,
          borderRadius: BorderRadius.circular(15.0)
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.home,color: whiteColor,size: 40.0,),
            SizedBox(height: 10.0,),
            Text("Total Visits ${widget.dashboard!.totalVisits==null?"150.0":widget.dashboard!.totalVisits.toString()}",style: TextStyle(color: Colors.white,fontSize: 14.0,height: 1.5),)
          ],
        ),
      ),
    );
  }
}






