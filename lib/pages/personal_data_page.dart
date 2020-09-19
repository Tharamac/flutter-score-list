import 'package:flutter/material.dart';
import 'package:score_list/config/routes.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          PersonStat(scoreList[widget.selectedDataIdx],
              widget.dataListSorted.indexOf(scoreList[widget.selectedDataIdx])),
          Text(
            "Next Person: " + (_isAlreadyTop ? "(Highest)" : ""),
            style: TextStyle(fontSize: 25),
          ),
          GestureDetector(
            child: PersonCard(widget.dataListSorted[_nextPersonDataIdx], 0),
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
          ;
        }),
        tooltip: "Edit Data",
        child: Icon(Icons.edit),
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  final ScoreData data;
  final int ranking;
  PersonCard(this.data, this.ranking);
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

class PersonStat extends StatelessWidget {
  final ScoreData data;
  final int ranking;
  PersonStat(this.data, this.ranking);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF05ffde),
      padding: EdgeInsets.fromLTRB(45, 30, 45, 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "${data.id}",
                style: TextStyle(
                  color: Color(0xFF36756d),
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              ),
              Expanded(
                  child: Text(
                data.name,
                style: TextStyle(
                    color: Color(0xFF094d44),
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              )),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  color: Colors.black38,
                  width: 150,
                  height: 150,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Ranking",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      ),
                      Text(
                        '$ranking',
                        style: TextStyle(
                          fontSize: 75,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
              ),
              Container(
                  color: Colors.black38,
                  width: 150,
                  height: 150,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Score",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      ),
                      Text(
                        '${data.score}',
                        style: TextStyle(
                          fontSize: 75,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
