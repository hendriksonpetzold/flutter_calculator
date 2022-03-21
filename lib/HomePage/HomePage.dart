import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor, ) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
          color: btncolor,
          borderRadius: const BorderRadius.all(Radius.circular(100)),),
      child: TextButton(
        onPressed: () {calculation(btntxt);},
        child: Text(btntxt),
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 30),
          primary: txtcolor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100))),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      //appBar: AppBar(title: const Text('xd xd xd '),),
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
            children: <Widget>[
              calcbutton(
                'C', const Color.fromRGBO(26, 26, 26, 1), Colors.red),
              calcbutton(
                  '( )', const Color.fromRGBO(26, 26, 26, 1), Colors.green),
              calcbutton(
                  '%', const Color.fromRGBO(26, 26, 26, 1), Colors.green),
              calcbutton(
                  '÷', const Color.fromRGBO(26, 26, 26, 1), Colors.green),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              calcbutton(
                  '7', const Color.fromRGBO(26, 26, 26, 1), Colors.white),
              calcbutton(
                  '8', const Color.fromRGBO(26, 26, 26, 1), Colors.white),
              calcbutton(
                  '9', const Color.fromRGBO(26, 26, 26, 1), Colors.white),
              calcbutton(
                  'x', const Color.fromRGBO(26, 26, 26, 1), Colors.green),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              calcbutton(
                  '4', const Color.fromRGBO(26, 26, 26, 1), Colors.white),
              calcbutton(
                  '5', const Color.fromRGBO(26, 26, 26, 1), Colors.white),
              calcbutton(
                  '6', const Color.fromRGBO(26, 26, 26, 1), Colors.white),
              calcbutton(
                  '-', const Color.fromRGBO(26, 26, 26, 1), Colors.green),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              calcbutton(
                  '1', const Color.fromRGBO(26, 26, 26, 1), Colors.white),
              calcbutton(
                  '2', const Color.fromRGBO(26, 26, 26, 1), Colors.white),
              calcbutton(
                  '3', const Color.fromRGBO(26, 26, 26, 1), Colors.white),
              calcbutton(
                  '+', const Color.fromRGBO(26, 26, 26, 1), Colors.green),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              calcbutton('', const Color.fromRGBO(26, 26, 26, 1), Colors.white),
              calcbutton(
                  '0', const Color.fromRGBO(26, 26, 26, 1), Colors.white),
              calcbutton(
                  ',', const Color.fromRGBO(26, 26, 26, 1), Colors.white),
              calcbutton(
                  '=', const Color.fromARGB(255, 54, 158, 43), Colors.white),
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
         num1 = double.parse(result); // passo 1 = digitou 20 e apertou o mais(+) num 1 recebeu 20
         
       }
       else{
         num2 = double.parse(result); // passo 2 = digitou outro 20 e apertou =, ESSE NUMERO RECEBEU O 20
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
      
     firstOperator = secondOperator; // passo 2 = firstOperator vai receber o MAIS ( + )
     secondOperator = btnText; // passo 1 = apertou o + para somar e second operator recebeu ( + )   || passo 2 = o secondOperator vai receber o IGUAL( = )
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


