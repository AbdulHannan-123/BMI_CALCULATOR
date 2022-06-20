import 'package:flutter/material.dart';
import 'dart:math';


class CalculatorBrain {

  CalculatorBrain({this.height,this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculatorBMI(){
    _bmi = weight/ pow(height/ 100,2 );
    return _bmi.toStringAsFixed(1);
  }

  String getResults(){
    if(_bmi >= 25){
      return 'OVER WEIGHT';
    }
    else if(_bmi >18.5){
      return 'WEIGHT IS NORMAL';
    }
    else{
      return 'UNDER-WEIGHT';
    }
  }

  String getInterpretation(){
     if(_bmi >= 25){
      return 'DO EXCERSIZE';
    }
    else if(_bmi >18.5){
      return 'GOOD JOB';
    }
    else{
      return 'EAT MORE';
    }
  }


  
}