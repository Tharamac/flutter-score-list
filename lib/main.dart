import 'package:flutter/material.dart';
import 'package:score_list/config/routes.dart';
import 'package:score_list/score.dart';
import 'pages/edit_score_page.dart';
import 'pages/home_page.dart';
import 'pages/personal_data_page.dart';

// Sept 23rd , create tag part2 before 5pm
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jura Tempest Hall of Fame',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          brightness: Brightness.dark,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              foregroundColor: Colors.white, backgroundColor: Colors.pink),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Kumbhsans"),
      routes: {
        AppRoutes.home: (context) => HomePage(),
        //AppRoutes.editScorePage: (context) => EditScorePage()
      },
      onGenerateRoute: _regRoutesWithParams,
    );
  }
}

Route _regRoutesWithParams(RouteSettings settings) {
  if (settings.name == AppRoutes.personalDataPage) {
    return MaterialPageRoute(builder: (context) {
      PersonalDataParameter param = settings.arguments;
      return PersonalDataPage(param.selectedDataIdx);
    });
  } else if (settings.name == AppRoutes.editScorePage) {
    return MaterialPageRoute(builder: (context) {
      ScoreData param = settings.arguments;
      return EditScorePage(param);
    });
  }
}
