import 'package:flutter/material.dart';
import 'package:midterm_620710724/process.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Midterm Exam',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  var process = sum();

  final input1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              color: Colors.lightBlue[100],
            ),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(200.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.yellow.shade50,
                  border: Border.all(width: 5.0, color: Colors.amber),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.lightGreenAccent.withOpacity(0.3),
                        offset: const Offset(2.0, 5.0),
                        blurRadius: 5.0,
                        spreadRadius: 2.0)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Temperature Converter',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: TextField(
                                          controller: input1,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            hintText:
                                            'Enter a termperature value to convert',
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          Expanded(
                            //ปุ่ม1
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Celsius to Fahrenheit',
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.black),
                                    ),
                                  ),
                                  onPressed: () {
                                    var data1 = double.tryParse(input1.text);
                                    if (data1 == null) {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('ERROR'),
                                            content: Text(
                                                "Please enter a value to convert"),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      var cctofahrenheit = process.calculateCCtoFah(data1);

                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Celsius to Farenheit'),
                                            content: Text("Ans: $cctofahrenheit "),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),


                          Expanded(
                            //ปุ่ม2
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Celsius to Kelvin',
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.black),
                                    ),
                                  ),
                                  onPressed: () {
                                    var data2 = double.tryParse(input1.text);
                                    if (data2 == null) {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('ERROR'),
                                            content: Text(
                                                "Please enter a value to convert"),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      var cctokel = process.calculateCCtoKel(data2);

                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Celsius to Kelvin'),
                                            content: Text("Ans: $cctokel "),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            //ปุ่ม3
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Fahrenheit to Celsius',
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.black),
                                    ),
                                  ),
                                  onPressed: () {
                                    var data3 = double.tryParse(input1.text);
                                    if (data3 == null) {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('ERROR'),
                                            content: Text(
                                                "Please enter a value to convert"),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      var fahtoCel = process.calculateFahtoCel(data3);

                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Fahrenheit to Celsius'),
                                            content: Text("Ans: $fahtoCel "),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),




                          Expanded(
                            //ปุ่ม4
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Fahrenheit to Kelvin',
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.black),
                                    ),
                                  ),
                                  onPressed: () {
                                    var data4 = double.tryParse(input1.text);
                                    if (data4 == null) {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('ERROR'),
                                            content: Text(
                                                "Please enter a value to convert"),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      var fahtokel = process.calculateFahtoKel(data4);

                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Fahrenheit to Kelvin'),
                                            content: Text("Ans: $fahtokel "),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),




                          Expanded(
                            //ปุ่ม5
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Kelvin to Celsius',
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.black),
                                    ),
                                  ),
                                  onPressed: () {
                                    var data5 = double.tryParse(input1.text);
                                    if (data5 == null) {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('ERROR'),
                                            content: Text(
                                                "Please enter a value to convert"),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      var keltocel = process.calculateKeltoCC(data5);

                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Kelvin to Celsius'),
                                            content: Text("Ans: $keltocel "),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),




                          Expanded(

                            //ปุ่ม6
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Kelvin to Fahrenheit',
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.black),
                                    ),
                                  ),
                                  onPressed: () {
                                    var data6 = double.tryParse(input1.text);
                                    if (data6 == null) {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('ERROR'),
                                            content: Text(
                                                "Please enter a value to convert"),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      var keltofah = process.calculateKeltoFah(data6);

                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Kelvin to Fahrenheit'),
                                            content: Text("Ans: $keltofah "),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}