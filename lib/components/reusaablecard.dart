import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {

  ReusableCard({@required this.colour, this.cardCont,this.ReGender});

  final Color colour;
  final Widget cardCont;

  final Function ReGender;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ReGender,
      child: Container(
        child: cardCont,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  


}