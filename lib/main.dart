import 'package:flutter/material.dart';
import 'package:score_list/config/routes.dart';
import 'pages/edit_score_page.dart';
import 'pages/home_page.dart';
import 'pages/personal_data_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        
      ),
      home: HomePage(title: 'Welcome to Hall of Fame'),
      routes: {
        AppRoutes.home : (context) => HomePage(),
        AppRoutes.personalDataPage : (context) =>  PersonalDataPage(),
        AppRoutes.editScorePage : (context) => EditScorePage()
      },
      onGenerateRoute: _regRoutesWithParams,
    );
  }
}

Route _regRoutesWithParams(RouteSettings settings){
  
}