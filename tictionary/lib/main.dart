import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:tictionary/translate/text_translation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tictionary',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> sampleData = ["Translate", "Points of interest"];

  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    print("The length is");
    print(sampleData.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Color.fromARGB(199, 157, 186, 157),
      ),
      backgroundColor: Color.fromARGB(255, 227, 241, 227),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
            child: Image.asset("assets/icon_tictionary.jpg",),),
            Container(height: 50,),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Tictionary presents with several functionalities click on the corresponding button for the same',
                style: TextStyle(fontSize: 20.0,
                    fontFamily: 'nunito',
                    ),
                    textAlign: TextAlign.center,
              ),
            ),
            Container(height: 30,),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: sampleData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 20, 30),
                    child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color.fromARGB(150,0, 100,  0),
                          ),
                          onPressed: () { },
                      child: Container(
                        height: 75,
                        width: 150,
                        
                        child: Text(sampleData[index], style: TextStyle(fontSize: 17.0,
                    fontFamily: 'nunito',color: Color.fromARGB(255, 8, 8, 8)),textAlign: TextAlign.center,),
                    alignment: Alignment.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
