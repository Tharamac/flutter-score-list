import 'package:flutter/material.dart';
import 'package:score_list/score.dart';

class PersonCard extends StatelessWidget {
  final ScoreData data;
  final int ranking;
  PersonCard(this.data, this.ranking);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFF25e69f),
        padding: EdgeInsets.fromLTRB(45, 20, 45, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Ranking : ",
                          style: TextStyle(
                              color: Color(0xFF113628),
                              fontSize: 20,
                              fontWeight: FontWeight.w400)),
                      Text("$ranking",
                          style: TextStyle(
                              color: Color(0xFF113628),
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            if (ranking == 1)
                              Image.asset(
                                'assets/images/Crown1.png',
                                height: 20,
                              ),
                            Text(
                              "${data.id}",
                              style: TextStyle(
                                  color: Color(0xFF113628),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                      ),
                      Expanded(
                        child: Text(
                          data.name,
                          style: TextStyle(
                              color: Color(0xFF113628),
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
                color: Colors.black38,
                padding: EdgeInsets.all(10),
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Score",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF00ffa0),
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    ),
                    Text(
                      '${data.score}',
                      style: TextStyle(
                          fontSize: 60,
                          color: Color(0xFF00ffa0),
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ))
          ],
        ));
  }
}
