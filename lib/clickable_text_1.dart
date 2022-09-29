import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  bool isFlip = false;
  var whatYouWant = "hello World.";

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

                isFlip = !isFlip;

                whatYouWant = (isFlip)?"Our dreams will come true. ^^.":
                "I believe this will be a really cool app.\n Because we'll make it happen!!";


              });

              print("Let's make ours Dreams come true");
            },
            child:Text(whatYouWant),
            // child: (isFlip)?
            //   Text("Our dreams will come true."):
            //   Text("Hello world"),
          ),
        ),
      ),
    );
  }
}