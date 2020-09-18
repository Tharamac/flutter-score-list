import 'package:flutter/material.dart';
import 'package:score_list/score.dart';

import '../config/routes.dart';
import '../pages/personal_data_page.dart';

class ScoreView extends StatelessWidget {
  final int idx;
  ScoreView({this.idx});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: const Color(0xFF65AA0D),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "${scoreList[idx].id}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            Expanded(
              child: Text(
                scoreList[idx].name,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              '${scoreList[idx].score}',
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.personalDataPage,
          arguments: PersonalDataParameter(idx)),
    );
  }
}

// class _ScoreViewState extends State<ScoreView> {

// }
