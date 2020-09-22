import 'package:flutter/material.dart';
import 'package:score_list/config/routes.dart';
import 'package:score_list/widget/person_card.dart';
import 'package:score_list/widget/person_stat.dart';

import '../score.dart';

class PersonalDataParameter {
  final int selectedDataIdx;
  PersonalDataParameter(this.selectedDataIdx);
}
// send list to another page

class PersonalDataPage extends StatefulWidget {
  final int selectedDataIdx;
  final List<ScoreData> dataListSorted = List.from(scoreList);
  PersonalDataPage(this.selectedDataIdx) {
    dataListSorted.sort((a, b) => a.score.compareTo(b.score));
  }

  @override
  _PersonalDataPageState createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  int _nextPersonDataIdx;
  bool _isAlreadyTop = false;

  @override
  void initState() {
    _nextPersonDataIdx =
        widget.dataListSorted.indexOf(scoreList[widget.selectedDataIdx]) + 1;
    if (_nextPersonDataIdx >= widget.dataListSorted.length) {
      _nextPersonDataIdx = widget.dataListSorted.length - 1;
      print("ALREADY TOP!");
      _isAlreadyTop = true;
    }
    super.initState();
  }

  void _getNextPerson() {
    setState(() {
      if (++_nextPersonDataIdx >= widget.dataListSorted.length - 1) {
        _nextPersonDataIdx = widget.dataListSorted.length - 1;
        print("TOP!");
        _isAlreadyTop = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          scoreList[widget.selectedDataIdx].name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
          ),
          PersonStat(
              scoreList[widget.selectedDataIdx],
              widget.dataListSorted.length -
                  widget.dataListSorted
                      .indexOf(scoreList[widget.selectedDataIdx])),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
          ),
          FlatButton(
            child: Text(
              "Next Person >>",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            onPressed: _getNextPerson,
          ),
          GestureDetector(
            child: PersonCard(widget.dataListSorted[_nextPersonDataIdx],
                widget.dataListSorted.length - _nextPersonDataIdx),
            onTap: _getNextPerson,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .pushNamed(AppRoutes.editScorePage,
                arguments: scoreList[widget.selectedDataIdx])
            .then((flag) {
          if (flag) {
            setState(() {});
            Navigator.pop(context, true);
          }
        }),
        tooltip: "Edit Data",
        child: Icon(Icons.edit),
      ),
    );
  }
}
