import 'package:flutter/material.dart';
import 'package:score_list/score.dart';

import '../config/routes.dart';
import '../pages/personal_data_page.dart';

class ScoreView extends StatelessWidget {
  final int idx;
  final List<ScoreData> wholeList;
  ScoreView({this.idx, this.wholeList});
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
              "${wholeList[idx].id}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            Expanded(
              child: Text(
                wholeList[idx].name,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              '${wholeList[idx].score}',
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.personalDataPage,
          arguments: PersonalDataParameter(wholeList[idx], wholeList)),
    );
  }
}

// class _ScoreViewState extends State<ScoreView> {

// }
