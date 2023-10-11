import 'package:flutter/material.dart';
import 'package:tictionary/main.dart';

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
            child: Column(children: <Widget>[
              const Text(
                "Welcome!",
                style: TextStyle(
                    fontFamily: 'raleway',
                    fontSize: 32,
                    color: Color.fromARGB(255, 8, 143, 118),
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.start,
              ),
              const Text(
                "A one-stop destination for your travel needs!",
                style: TextStyle(
                  fontFamily: 'nunito',
                  fontSize: 18,
                  color: Color.fromARGB(255, 68, 62, 62),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 440,
                child: Column(
                  children: [
                    Container(
                      height: 20,
                    ),
                    Image.asset(
                      'images/logo.jpeg',
                    ),
                    Container(
                      height: 25,
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 8, 143, 118),
                          shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(32),
                          ),
                          textStyle: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyApp(),
                            ),
                          );
                        },
                        child: const Center(
                          child: Text(
                            "Get Started!",
                            style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 20,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
