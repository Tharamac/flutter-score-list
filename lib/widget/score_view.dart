import 'package:flutter/material.dart';

class ScoreView extends StatelessWidget {
  final String name;
  final int score;
  ScoreView({this.name, this.score});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 4,
              fontWeight: FontWeight.normal
            ),
          ),
          Text(
            '$score',
            style:  TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700
            ),
          )
        ],
      ),
    );
  }
 
}

// class _ScoreViewState extends State<ScoreView> {
  
// }