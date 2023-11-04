import 'package:multiTool/main.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget{
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();

  }
class _SplashState extends State<Splash> {
  void initstate() {
    super.initState();
    dashhome();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: Image.asset('assets/Logo.png'),
                    )
                  
        );

  }

  void dashhome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
  }
}