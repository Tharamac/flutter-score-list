import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:score_list/config/routes.dart';
import 'package:score_list/pages/edit_score_page.dart';
import 'package:score_list/score.dart';
import 'package:score_list/widget/score_view.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF34ebb7),
        centerTitle: true,
        title: Text(
          "Jura Tempest: Hall of Fame",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: scoreList.length,
          itemBuilder: (BuildContext context, int i) {
            return ScoreView(
              idx: i,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, AppRoutes.editScorePage).then((flag) {
          print(flag);
          setState(() {});
        }),
        tooltip: 'Add New Record',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
