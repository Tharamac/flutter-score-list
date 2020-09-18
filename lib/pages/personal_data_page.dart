import 'package:flutter/material.dart';

import '../score.dart';

class PersonalDataParameter {
  final int selectedDataIdx;
  List<ScoreData> dataListSorted;
  PersonalDataParameter(this.selectedDataIdx) {
    dataListSorted = List.from(scoreList);
    dataListSorted.sort((a, b) => a.score.compareTo(b.score));
  }
}
// send list to another page

class PersonalDataPage extends StatefulWidget {
  final int selectedDataIdx;
  PersonalDataPage(this.selectedDataIdx);

  @override
  _PersonalDataPageState createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              color: const Color(0xFF65AA0D),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${scoreList[widget.selectedDataIdx].id}\t",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  Expanded(
                    child: Text(
                      scoreList[widget.selectedDataIdx].name,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    '${scoreList[widget.selectedDataIdx].score}',
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
