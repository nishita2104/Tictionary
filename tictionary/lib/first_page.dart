// ignore_for_file: unnecessary_new
import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  @override
  createState() {
    return new CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  // ignore: deprecated_member_use
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new RadioModel(false, 'o', 'Solo '));
    sampleData.add(new RadioModel(false, 'o', 'Group'));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListItem"),
      ),
      body: new ListView.builder(
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            //highlightColor: Colors.red,
            splashColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                sampleData.forEach((element) => element.isSelected = false);
                sampleData[index].isSelected = true;
              });
            },
            child: new RadioItem(sampleData[index]),
          );
        },
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;

  RadioModel(this.isSelected, this.buttonText, this.text);
}


class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Center(
        child: SingleChildScrollView(
          //child: Card(
          child: Container(
            color: const Color(0xFFF9F9F9),
            padding: const EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                const Text(
                  "Welcome!",
                  style: TextStyle(
                      fontFamily: 'raleway',
                      fontSize: 32,
                      color: Color(0xFFD80041),
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.start,
                ),
                const Text(
                  "Save your time and efforts with Tictionary your own travel dictionary...",
                  style: TextStyle(
                    fontFamily: 'nunito',
                    fontSize: 18,
                    color: Color.fromARGB(255, 68, 62, 62),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 440,
                  child: GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: 1.25,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    children: [
                      // Image.asset(
                      //   'assets/ingredients.png',
                      // ),
                      const Center(
                        child: Text(
                          "Are you travelling alone?",
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14,
                              color: Color.fromARGB(255, 68, 62, 62)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // Image.asset('assets/search.png'),
                      const Center(
                        child: Text(
                          "Search through a database of over 6000 recipes to find the most suitable recipe",
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14,
                              color: Color.fromARGB(255, 68, 62, 62)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                ListView.builder(
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            //highlightColor: Colors.red,
            splashColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                sampleData.forEach((element) => element.isSelected = false);
                sampleData[index].isSelected = true;
              });
            },
            child: new RadioItem(sampleData[index]),
          );
        },
      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}