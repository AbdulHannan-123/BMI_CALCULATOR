
import '../components/bottom_button.dart';
import '../components/constant.dart';
import 'package:flutter/material.dart';
import '../components/reusaablecard.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child:Container(
              child: Text('YOUR RESULT',
              textAlign: TextAlign.center,
              style: KtextStyle,
              ),
            ) 
          ),

          Expanded(
            flex: 5,
            child: ReusableCard(colour: Kactiveccontainercolor,
              cardCont: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [
                  Text(
                    resultText,
                    style: KresultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: Kbmitextstyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: Kbodytextstyle,
                  )
                ],
              ),
            )
            ),

            BottomButton(buttonTitle:'RE_CALCULATE',
              onTap: (){
                Navigator.pop(context);
              },
             ),

        ],
      ),
    );
    
  }
}