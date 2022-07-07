import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sales_automation_project/providers/RegionProvider.dart';
import 'package:sales_automation_project/providers/area_provider.dart';
import 'package:sales_automation_project/providers/attendance_provider.dart';
import 'package:sales_automation_project/providers/daily_activity_provider.dart';
import 'package:sales_automation_project/providers/dashboard_provider.dart';
import 'package:sales_automation_project/providers/get_cities_provider.dart';
import 'package:sales_automation_project/providers/user_provider.dart';
import 'package:sales_automation_project/screens/login_screen.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>UserDataProvider()),
        ChangeNotifierProvider(create: (context)=>DashboardProvider()),
        ChangeNotifierProvider(create: (context)=>DailyActivityProvider()),
        ChangeNotifierProvider(create: (context)=>GetRegionProvider()),
        ChangeNotifierProvider(create: (context)=>GetCitiesProvider()),
        ChangeNotifierProvider(create: (context)=>AreaProvider()),
        ChangeNotifierProvider(create: (context)=>MarkAttendanceProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: LoginScreen(),
      ),
    );
  }
}

