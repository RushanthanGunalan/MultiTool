import 'package:multiTool/chat.dart';
import 'package:multiTool/note.dart';
import 'package:multiTool/splash.dart';
import 'package:flutter/material.dart';
import 'package:multiTool/calculator.dart';
import 'watch.dart';
import 'camera.dart';
import 'ocr.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(
       MaterialApp(
        home: AnimatedSplashScreen(splash: const Splash(), nextScreen: const Dashboard(),),
      )
  );
}


class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  get child => null;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("MultiTool"),

      ),

      backgroundColor: Colors.grey,

      drawer: Drawer(
        child: Container(
          color: Colors.grey,
        child: ListView(
          children:  <Widget>[
             const DrawerHeader(
               child: Text("", style: TextStyle(
                 fontSize: 20
               ),),
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage("assets/BGI.png"),
                   fit: BoxFit.cover
                 )
               ),
             ),

            ListTile(
              leading: const Icon(Icons.camera,
                            color: Colors.white),
              title: const Text("Camera"),
              textColor: Colors.white,
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const camera()));
              },

            ),
            ListTile(
              leading: const Icon(Icons.note_add_outlined,
                  color: Colors.white),
              title: const Text("Notepad"),
              textColor: Colors.white,
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const note()));
              },

            ),
        ListTile(
          leading: const Icon(Icons.calculate,
              color: Colors.white),
          title: const Text("Calculator"),
          textColor: Colors.white,
          onTap: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Calculators()));
          },
        ),
            ListTile(
              leading: const Icon(Icons.search,
                  color: Colors.white),
              title: const Text("OCR Reader"),
              textColor: Colors.white,
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Ocr()));
              },

            ),
            ListTile(
              leading: const Icon(Icons.chat_bubble,
                  color: Colors.white),
              title: const Text("Bot"),
              textColor: Colors.white,
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Chatbot()));
              },

            ),
            ListTile(
              leading: const Icon(Icons.timer,
                  color: Colors.white),
              title: const Text("Stopwatch"),
              textColor: Colors.white,
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const stopW()));
              },

            ),],

        ),

      ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: MaterialButton(
                        color: Colors.blueGrey,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const camera()),
                          );
                        },

                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset("assets/camera.png" ,width: 64),
                                const SizedBox(height: 10.0),
                                const Text("Camera", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                )),
                                const SizedBox(height: 5.0),


                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: MaterialButton(
                        color: Colors.blueGrey,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Ocr()),
                          );
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset("assets/ocr.png" ,width: 64),
                                const SizedBox(height: 10.0),
                                const Text("OCR Reader", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                )),

                                const SizedBox(height: 5.0),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: MaterialButton(
                        color: Colors.blueGrey,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const note()),
                          );
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset("assets/notepad.png" ,width: 64),
                                const SizedBox(height: 10.0),
                                const Text("Notepad", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                )),



                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: MaterialButton(
                        color: Colors.blueGrey,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Chatbot()),
                          );
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset("assets/bot.png" ,width: 64),
                                const SizedBox(height: 10.0),
                                const Text("Bot", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                )),

                                const SizedBox(height: 5.0),


                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: MaterialButton(
                        color: Colors.blueGrey,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const stopW()),
                          );
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset("assets/stopW.png" ,width: 64),
                                const SizedBox(height: 10.0),
                                const Text("StopWatch", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                )),
                                const SizedBox(height: 5.0),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: MaterialButton(
                        color: Colors.blueGrey,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Calculators()),
                          );
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset("assets/calculator.png" ,width: 64),
                                const SizedBox(height: 10.0),
                                const Text("Calculator", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                )),
                                const SizedBox(height: 5.0),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),




                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


