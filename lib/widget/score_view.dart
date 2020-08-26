import 'package:flutter/material.dart';

class ScoreView extends StatelessWidget {
  final int number;
  final String name;
  final int score;
  ScoreView({this.number = 0, this.name, this.score});
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
              "$number\t",
              style:  TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700
              ),
            ),
            Expanded(
              child:  Text(
                name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Text(
              '$score',
              style:  TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w700
              ),
            )
          ],
        ),
      )
    );
  }
 
}

// class _ScoreViewState extends State<ScoreView> {
  
// }