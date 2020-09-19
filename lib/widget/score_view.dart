import 'package:flutter/material.dart';
import 'package:score_list/score.dart';

import '../config/routes.dart';
import '../pages/personal_data_page.dart';

class ScoreView extends StatefulWidget {
  final int idx;
  ScoreView({this.idx});
  @override
  _ScoreViewState createState() => _ScoreViewState();
}

class _ScoreViewState extends State<ScoreView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        // color: const Color(0xFF65AA0D),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "${scoreList[widget.idx].id}",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'KumbhSans'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            ),
            Expanded(
              child: Text(
                scoreList[widget.idx].name,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              '${scoreList[widget.idx].score}',
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
      onTap: () => Navigator.pushNamed(context, AppRoutes.personalDataPage,
              arguments: PersonalDataParameter(widget.idx))
          .then((flag) {
        if (flag) setState(() {});
      }),
    );
  }
}

// class _ScoreViewState extends State<ScoreView> {

// }
