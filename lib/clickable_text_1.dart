import 'package:flutter/material.dart';
import 'package:fade_out_particle/fade_out_particle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();

}


class _MyAppState extends State<MyApp> {
  bool firstVisit = true;
  bool isFlip = false;
  bool isDisappear = false;
  var whatYouWant = "Hello  World";

  _setValues(withOutFlip){

    isFlip = (withOutFlip)? (!isFlip):isFlip;

    if(!firstVisit){

      whatYouWant = (isFlip)?"Our dreams\n "
          "will come true\n"
          "\n"
          "Let's believe in\n "
          "our possibilities"
          :
      "I believe this will be a really cool app.\n "
          "Because we'll make it happen!!\n"
          "        . . .\n"
          "Let's look in the same direction\n "
          "& let's make success!!";
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clickable Text Using GestureDetector',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Flutter Clickable Text Example'),
        // ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _setValues(false);
              });
              Future.delayed(const Duration(milliseconds: 1000), () {

                setState(() {
                  isDisappear = true;
                });

              });

              print("Let's make ours Dreams come true.");
            },
            child: FadeOutParticle(
              duration: Duration(milliseconds: 2000),
              disappear: isDisappear,
              child:  Text(whatYouWant,style: Theme.of(context).textTheme.headline6?.copyWith(
                  //fontWeight: (!isFlip)?FontWeight.w900:FontWeight.w100,
                  fontSize: (!isFlip)?48:30,
                  fontFamily:(firstVisit)?'hugs':(!isFlip)?'helloketta':'whoa'
              ),
              ),
              onAnimationEnd: (){
                setState(() {
                  firstVisit = false;
                  isDisappear = false;
                  _setValues(true);
                });
              },
            ),

            // child: (isFlip)?
            //   Text("Our dreams will come true."):
            //   Text("Hello world"),
          ),
        ),
      ),
    );
  }
}