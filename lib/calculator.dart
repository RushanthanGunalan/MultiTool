import 'package:flutter/material.dart';

/*Code Referred from "The Flutter Lab" - Youtube
  Author - The Flutter Lab
  Date - 08/02/2022
  Website - "https://www.youtube.com/watch?v=cUxyqztdwwM&t=258s"
 */

class Calculators extends StatefulWidget {
  const Calculators({Key? key}) : super(key: key);

  @override
  _CalculatorsState createState() => _CalculatorsState();
}

class _CalculatorsState extends State<Calculators> {
  dynamic displaytxt = 20;
  //Button Widget
  Widget calcbutton(String btntxt,Color btncolor,Color txtcolor){
    return  ElevatedButton(
      onPressed: (){
        calculation(btntxt);
      },
      child:
      Text(btntxt,
        style: TextStyle(
          fontSize: 30,
          color: txtcolor,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    //Calculator
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Calculator display
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('$text',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('AC',Colors.blueGrey,Colors.white),
                calcbutton('%',Colors.blueGrey,Colors.white),
                calcbutton('/',Colors.blueGrey,Colors.white),
              ],
            ),
            const SizedBox(height: 08,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('7',Colors.blueGrey,Colors.white),
                calcbutton('8',Colors.blueGrey,Colors.white),
                calcbutton('9',Colors.blueGrey,Colors.white),
                calcbutton('x',Colors.blueGrey,Colors.white),
              ],
            ),
            const SizedBox(height: 08,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('4',Colors.blueGrey,Colors.white),
                calcbutton('5',Colors.blueGrey,Colors.white),
                calcbutton('6',Colors.blueGrey,Colors.white),
                calcbutton('-',Colors.blueGrey,Colors.white),
              ],
            ),
            const SizedBox(height: 08,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1',Colors.blueGrey,Colors.white),
                calcbutton('2',Colors.blueGrey,Colors.white),
                calcbutton('3',Colors.blueGrey,Colors.white),
                calcbutton('+',Colors.blueGrey,Colors.white),
              ],
            ),
            const SizedBox(height: 08,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //this is button Zero
                ElevatedButton(
                  onPressed: (){
                    calculation('0');
                  },
                  child: const Text('0',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white),
                  ),
                ),
                calcbutton('=',Colors.blueGrey,Colors.white),
              ],
            ),
            const SizedBox(height: 08),
          ],
        ),
      ),
    );
  }


  dynamic text ='0';
  double num1 = 0;
  double num2 = 0;

  dynamic result = '';
  dynamic finalValue = '';
  dynamic opr = '';
  dynamic onPressbtn = '';
  void calculation(btnText) {


    if(btnText  == 'AC') { //Clear all values
      text ='0';
      num1 = 0;
      num2 = 0;
      result = '';
      finalValue = '0';
      opr = '';
      onPressbtn = '';

    } else if( opr == '=' && btnText == '=') {

      if(onPressbtn == '+') {
        finalValue = add();
      } else if( onPressbtn == '-') {
        finalValue = sub();
      } else if( onPressbtn == 'x') {
        finalValue = mul();
      } else if( onPressbtn == '/') {
        finalValue = div();
      }

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(num1 == 0) {
        num1 = double.parse(result);
      } else {
        num2 = double.parse(result);
      }

      if(opr == '+') {
        finalValue = add(); //Trigger add function if '+' is pressed
      } else if( opr == '-') {
        finalValue = sub(); //Trigger sub function if '-' is pressed
      } else if( opr == 'x') {
        finalValue = mul();//Trigger mul function if 'x' is pressed
      } else if( opr == '/') {
        finalValue = div(); //Trigger div function if '/' is pressed
      }
      onPressbtn = opr;
      opr = btnText;
      result = '';
    }
    //Calculate Percentage of num1
    else if(btnText == '%') {
      result = num1 / 100;

    } else {
      result = result + btnText;
      finalValue = result;
    }


    setState(() {
      text = finalValue;
    });

  }

//Adding two numbers
  String add() {
    result = (num1 + num2).toString();
    num1 = double.parse(result);
    return result;
  }

//subtracting two numbers
  String sub() {
    result = (num1 - num2).toString();
    num1 = double.parse(result);
    return result;
  }

//Multiply two numbers
  String mul() {
    result = (num1 * num2).toString();
    num1 = double.parse(result);
    return result;
  }

//Divide two numbers
  String div() {
    result = (num1 / num2).toString();
    num1 = double.parse(result);
    return result;
  }


}
class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String statement = "";
  String result = "0";
  final List<String> buttons = [
    '(', ')', '/', '7', '8', '9', '*', '4', '5', '6', '+', '1', '2', '3', '-', 'AC', '0', '=',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Flexible(flex: 2, child: resultWidget()),
            Expanded(flex: 4, child: _buttons()),
          ],
        ),
      ),
    );
  }

  Widget resultWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: Text(
            statement,
            style: const TextStyle(fontSize: 32),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.centerRight,
          child: Text(
            result,
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _buttons() {
    return GridView.builder(
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (BuildContext context, int index) {
        return _myButton(buttons[index]);
      },
      itemCount: buttons.length,
    );
  }

  _myButton(String text) {
    return Container(
        margin: const EdgeInsets.all(8),
        child: MaterialButton(
          onPressed: () {
            setState(() {
              handleButtonTap(text);
            });
          },
        )
    );
  }

  handleButtonTap(String text) {
    if (text == "AC") {
      statement = "";
      result = "0";
      return;
    }



  }


}
