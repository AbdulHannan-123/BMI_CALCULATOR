import 'package:flutter/material.dart';
import 'constant.dart';

class BottomButton extends StatelessWidget {  

  BottomButton({@required this.onTap,@required this.buttonTitle});
   final Function onTap;
   final String buttonTitle; 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        
        child: Text(buttonTitle,style:TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold) ,),
        color: Color(0xffeb1555),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: KBottonContainerHeight,
      ),
    );
  }
}

