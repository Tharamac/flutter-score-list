import 'package:flutter/material.dart';
import 'package:score_list/score.dart';

import '../widget/score_view.dart';

class EditScoreParameter {
  final ScoreData selectedData;
  EditScoreParameter([this.selectedData]);
}

class EditScorePage extends StatefulWidget {
  final ScoreData selectedData;
  EditScorePage([this.selectedData]);
  @override
  _EditScorePageState createState() => _EditScorePageState();
}

class _EditScorePageState extends State<EditScorePage> {
  TextEditingController _controller;
  bool _validate = false;
  bool _isAddNew = true;
  var numpadItem = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "CLR",
    "0",
    "OK"
  ];

  void initState() {
    super.initState();
    _controller = TextEditingController();
    _isAddNew = (widget.selectedData == null) ? true : false;
    if (_isAddNew) {
      _scoreInput = 0;
      _controller.text = "";
    } else {
      _scoreInput = widget.selectedData.score;
      _controller.text = widget.selectedData.name;
    }
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _scoreInput = 0;
  void _putNumber(int number) {
    setState(() {
      if (_scoreInput == 0) {
        if (number >= 0 && number <= 9) {
          _scoreInput = number;
        }
      } else if (_scoreInput.toString().length < 2) {
        if (number >= 0 && number <= 9) {
          _scoreInput = _scoreInput * 10 + number;
        }
      }
      if (number == -1) {
        _scoreInput = 0;
      }
    });
  }

  void acceptScore() {
    print(_isAddNew);
    int score = _scoreInput;
    String name = _controller.text;

    if (_isAddNew) {
      int idx = scoreList.length + 1;
      var newScore = ScoreData(idx, name, score);
      scoreList.add(newScore);
    } else {
      int idx = scoreList.indexOf(widget.selectedData);
      scoreList[idx].name = name;
      scoreList[idx].score = score;
    }
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_isAddNew ? "Add new record" : "Edit data"),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),
                  Text(
                    "Name: ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Expanded(
                      child: TextField(
                          controller: _controller,
                          maxLength: 16,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Your Name',
                            errorText:
                                _validate ? "Value cannot be empty." : null,
                          ))),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                color: Color(0xFF00ffbf),
                padding: EdgeInsets.fromLTRB(0, 25, 0, 10),
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text('$_scoreInput',
                    style: TextStyle(
                        fontSize: 60,
                        color: Color(0xFF04664d),
                        fontWeight: FontWeight.w700)),
              ),
              Expanded(
                  flex: 1,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 55,
                    mainAxisSpacing: 5,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(15),
                    primary: true,
                    children: numpadItem
                        .map<Widget>((item) => FlatButton(
                              onPressed: () {
                                if (item == "CLR")
                                  _putNumber(-1);
                                else if (item == "OK") {
                                  setState(() {
                                    _controller.text.isEmpty
                                        ? _validate = true
                                        : _validate = false;
                                  });
                                  if (_validate == false) acceptScore();
                                } else
                                  _putNumber(int.parse(item));
                              },
                              padding: EdgeInsets.all(0),
                              textColor: const Color(0xFF00ffbe),
                              child: Text(
                                item,
                                style: (item == "OK" || item == "CLR")
                                    ? TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w700)
                                    : TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.w700),
                              ),
                            ))
                        .toList(),
                  )),
            ],
          ),
        ));
  }
}
