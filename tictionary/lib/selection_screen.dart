import 'package:flutter/material.dart';
import 'package:tictionary/nearby/page.dart';
import 'package:tictionary/translate/translate_page.dart';


class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tictionary',
      home: SelectionScreenPage(),
    );
  }
}

class SelectionScreenPage extends StatefulWidget {
  SelectionScreenPage({Key? key}) : super(key: key);

  @override
  _SelectionScreenPageState createState() => _SelectionScreenPageState();
}

class _SelectionScreenPageState extends State<SelectionScreenPage> {
  List<String> sampleData = ["Translate", "Points of interest"];

  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    print("The length is");
    print(sampleData.length);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home Page'),
      //   backgroundColor: Color.fromARGB(199, 157, 186, 157),
      // ),
      backgroundColor: const Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF9F9F9),
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100,
              ),
              Container(
                height: 300,
                child: Image.asset(
                  "assets/icon_tictionary.jpg",
                ),
              ),
              Container(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Choose a functionality',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'nunito',
                    color: Color.fromARGB(255, 8, 143, 118),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 30,
              ),
              SizedBox(
                height: 128,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: sampleData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 20, 30),
                      child: SizedBox(
                        height: 80,
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 20, 175, 147),
                            shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(20),
                            ),
                            textStyle: const TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              index==0 ? MaterialPageRoute(
                                  builder: (context) => TranslatePage(),
                                      ): MaterialPageRoute(
                                  builder: (context) => NearByApp(),
                                      ),
                            );
                          },
                          child: Center(
                            child: Text(
                              sampleData[index],
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 20,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
