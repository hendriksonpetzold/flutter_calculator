import 'package:flutter/material.dart';

import '../button/button.dart';


class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _Calculator();
}


class _Calculator extends State<Calculator> {

 
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      Column(
        children:<Widget> [
          const SizedBox(height: 35,),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(text,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                  )
                ],
            ),
          ),
          
          Container(
            width: double.infinity,
            height: 350,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Calcbutton(btnTxt: 'C', btnColor:const Color.fromRGBO(26, 26, 26, 1) ,txtColor: Colors.red, buttonPressed:calculation),
              Calcbutton(btnTxt: '( )', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.green, buttonPressed: calculation),
              Calcbutton(btnTxt: '%', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.green, buttonPressed: calculation),
              Calcbutton(btnTxt: '÷', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.green, buttonPressed: calculation),   
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              Calcbutton(btnTxt: '7', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.white, buttonPressed: calculation),
              Calcbutton(btnTxt: '8', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.white, buttonPressed: calculation),
              Calcbutton(btnTxt: '9', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.white, buttonPressed: calculation),
              Calcbutton(btnTxt: 'x', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.green, buttonPressed: calculation),
              
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Calcbutton(btnTxt: '4', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.white, buttonPressed: calculation),
              Calcbutton(btnTxt: '5', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.white, buttonPressed: calculation),
              Calcbutton(btnTxt: '6', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.white, buttonPressed: calculation),
              Calcbutton(btnTxt: '-', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.green, buttonPressed: calculation),  
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Calcbutton(btnTxt: '1', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.white, buttonPressed: calculation),
              Calcbutton(btnTxt: '2', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.white, buttonPressed: calculation),
              Calcbutton(btnTxt: '3', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.white, buttonPressed: calculation),
              Calcbutton(btnTxt: '+', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.green, buttonPressed: calculation),  
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Calcbutton(btnTxt: '', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.white, buttonPressed: calculation),
              Calcbutton(btnTxt: '0', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.white, buttonPressed: calculation),
              Calcbutton(btnTxt: ',', btnColor: const Color.fromRGBO(26, 26, 26, 1), txtColor: Colors.white, buttonPressed: calculation),
              Calcbutton(btnTxt: '=', btnColor: const Color.fromARGB(255, 54, 158, 43), txtColor: Colors.white, buttonPressed: calculation),  
              
            ],
          ),
        ],
      ),
      
    );
    
    
  }
   dynamic text ='0';
  double num1 = 0;
  double num2 = 0;  
  dynamic result = '';
  dynamic finalResult = '';
  dynamic firstOperator = '';
  dynamic secondOperator = '';
   void calculation(btnText) {
     if(btnText == 'C'){
       text = '';
       btnText = '';
       num1 = 0;
       num2 = 0;
       result = '0';
       finalResult = '0';
       firstOperator = '';
       secondOperator = '';
       
      }
     
      else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '÷' || btnText == '=' ){
       if(num1 == 0){
         num1 = double.parse(result); 
         
       }
       else{
         num2 = double.parse(result); 
       }
      switch (secondOperator) {
        case '+': finalResult = soma(); 
        num1 = double.parse(finalResult);
        break;
        case '-':finalResult = sub(); 
        num1 = double.parse(finalResult);
        break;
        case 'x':finalResult = mult(); 
        num1 = double.parse(finalResult);
        break;
        case '÷': finalResult = div(); 
        num1 = double.parse(finalResult);
        break;

      }
      
     firstOperator = secondOperator; 
     secondOperator = btnText; 
     result = '0';
     } 
    
      
      else{
      
     result = result + btnText;
     finalResult = result;
      }
      
    setState(() {
      
      
      text = finalResult;
    });
   
    
  }

  String soma(){
    result = (num1 + num2).toString();
    return result;
    }
    String sub(){
    result = (num1 - num2).toString();
    return result;
    }
    String mult(){
    result = (num1 * num2).toString();
    return result;
    }
    String div(){
    result = (num1/num2).toString();
    return result;
    }
 
  
}


