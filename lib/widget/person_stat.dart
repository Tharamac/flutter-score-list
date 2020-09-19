import 'package:flutter/material.dart';

import '../score.dart';

class PersonStat extends StatelessWidget {
  final ScoreData data;
  final int ranking;
  PersonStat(this.data, this.ranking);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0eebcc),
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
                          fontSize: 30,
                          color: Color(0xFF00ffdc),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      ),
                      Text(
                        '$ranking',
                        style: TextStyle(
                          fontSize: 75,
                          color: Color(0xFF00ffdc),
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
                          fontSize: 30,
                          color: Color(0xFF00ffdc),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      ),
                      Text(
                        '${data.score}',
                        style: TextStyle(
                          color: Color(0xFF00ffdc),
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
