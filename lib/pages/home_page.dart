import 'package:flutter/material.dart';
import 'package:score_list/score.dart';
import 'package:score_list/widget/score_view.dart';

class HomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ScoreData> scoreList = [
    ScoreData(1, "Rimuru Tempest", 95),
    ScoreData(2, "Benimaru", 15),
    ScoreData(3, "Milim", 59),
    ScoreData(4, "Veldora Tempest", 97),
    ScoreData(5, "Isset Hyoudo", 41),
    ScoreData(6, "Tanya", 52),
    ScoreData(7, "Naruhodou Ryuichi", 72),
  ];

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Colors.white,
        title: Text(
          "Hall of Fame",
          style: TextStyle(
              color: Colors.black, fontSize: 50, fontWeight: FontWeight.w700),
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
              wholeList: scoreList,
              idx: i,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Add New Record',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
