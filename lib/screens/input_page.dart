import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/iconContent.dart';
import '../components/reusaablecard.dart';
import '../components/constant.dart';
import 'result_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';


enum Gender{
  male,
  female
}

 

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {

  Gender selectedgender;
  int height=180;
  int weight = 60;
  int age=15;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child:ReusableCard(
                    ReGender: (){
                      setState(() {
                        selectedgender=Gender.male;
                      });
                    },
                    colour: selectedgender==Gender.male? Kactiveccontainercolor:Kinactiveccontainercolor,
                    cardCont: ContUpperBody(icon:FontAwesomeIcons.mars, lable: 'MALE' ),
                    )
                ),
                Expanded(
                  child:ReusableCard(
                    ReGender: (){
                      setState(() {
                        selectedgender=Gender.female;
                      });
                    },
                    colour: selectedgender==Gender.female? Kactiveccontainercolor:Kinactiveccontainercolor,
                    cardCont: ContUpperBody(icon:FontAwesomeIcons.venus, lable: 'FEMALE' ),
                    )
                ),
              ],
            )
          ),

          Expanded(
            child: ReusableCard(
              colour: Kactiveccontainercolor,
              cardCont: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT'
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),style: KContainerStyle,
                            ),
                            Text(
                              'cm',style: KLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Color(0xffeb1555),
                            inactiveTrackColor: Color(0xff8d8e98),
                            thumbColor: Color(0xffeb1555),
                            overlayColor: Color(0x20eb1555),
                            thumbShape: 
                            RoundSliderThumbShape( enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 270.0,
                           // activeColor: Color(0xffeb1555),
                            //inactiveColor: Color(0xff8d8e98),
                            
                            onChanged: (double newValue){
                              setState(() {
                                
                              height=newValue.round();
                              });
                            },
                            ),
                        )
                        
                      ],

                    ),
              )
          ),


           Expanded(
            child: Row(
              children: [
                Expanded(
                  child:ReusableCard(
                    colour: Kactiveccontainercolor,
                    cardCont: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',style: KLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),style: KContainerStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                             RoundIconButton(icon: FontAwesomeIcons.minus ,
                             onPressed: (){
                              setState(() {
                                weight--;
                              });
                             },
                             ),
                             
                          SizedBox(width: 20.0),
                            RoundIconButton(icon: FontAwesomeIcons.plus ,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                            ),
                          ],
                        )
                      ],
                    ),
                    
                    )
                ),
                Expanded( child:ReusableCard(
                    colour: Kactiveccontainercolor,
                    cardCont: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',style: KLabelTextStyle,
                        ),
                        Text(
                          age.toString(),style: KContainerStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                             RoundIconButton(icon: FontAwesomeIcons.minus ,
                             onPressed: (){
                              setState(() {
                                age--;
                              });
                             },
                             ),
                             
                          SizedBox(width: 20.0),
                            RoundIconButton(icon: FontAwesomeIcons.plus ,
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },
                            ),
                          ],
                        )
                      ],
                    ),
                    
                    )
                ),
              ],
            )
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
          onTap: () {

            CalculatorBrain cal = CalculatorBrain(height: height,weight: weight);

         Navigator.push(context, MaterialPageRoute(builder: (context){
        return ResultPage(
          bmiResult: cal.calculatorBMI(),
          resultText: cal.getResults(),
          interpretation: cal.getInterpretation(),
        );
      },),);
      },),

          
           
        ],
        
      ),
     
    );
  }
}


class RoundIconButton extends StatelessWidget {
  @override

  RoundIconButton({this.icon,this.onPressed});
  final IconData icon;
  final Function onPressed;

  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon,color: Color(0xffeb1555), ),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 53.0,
        height: 53.0
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}


