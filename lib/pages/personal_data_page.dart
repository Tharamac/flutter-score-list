import 'package:flutter/material.dart';

import '../score.dart';

class PersonalDataParameter {
  final int selectedDataIdx;
  List<ScoreData> dataListSorted;
  PersonalDataParameter(this.selectedDataIdx);
}
// send list to another page

class PersonalDataPage extends StatefulWidget {
  final int selectedDataIdx;
  List<ScoreData> dataListSorted;
  PersonalDataPage(this.selectedDataIdx) {
    dataListSorted = List.from(scoreList);
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

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Already Top!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            PersonCard(scoreList[widget.selectedDataIdx]),
            Text(
              "Next Person: " + (_isAlreadyTop ? "(Already Top)" : ""),
              style: TextStyle(fontSize: 25),
            ),
            GestureDetector(
              child: PersonCard(widget.dataListSorted[_nextPersonDataIdx]),
              onTap: _getNextPerson,
            )
          ],
        ));
  }
}

class PersonCard extends StatelessWidget {
  final ScoreData data;
  PersonCard(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF65990D),
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "${data.id}",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          ),
          Expanded(
            child: Text(
              data.name,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            '${data.score}',
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
