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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  final input2 = TextEditingController();


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/guess_logo.png'), //BG
                fit: BoxFit.cover,
            ),
          ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: const [
                Text(
                  'GUESS',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 50.0,
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/guess_logo.png',
                width: 100,
                height: 100,
                //fit: BoxFit.fill,
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
                              Text("หัวข้อ1"),
                              Text("(จ้า)"),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: input1,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: 'ใส่ข้อมูล',

                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                  Expanded(
                    child: Container(
                        color: Colors.pink[100],
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("หัวข้อ2"),
                              Text("(ครับ)"),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: input2,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: 'ใส่ข้อมูล',
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                  Expanded( //ปุ่ม
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('ชื่อปุ่ม',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white
                              ),
                            ),
                          ),
                          onPressed: (){
                            var data1 = double.tryParse(input1.text);
                            var data2 = double.tryParse(input2.text);
                            if(data1 == null || data2 == null){
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('ERROR'),
                                    content: Text("Invalid input"),
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
                            }else{
                              var weight = process.calculate(data1, data2);
                              var price = weight/2;


                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(

                                    title: Text('RESULT'),
                                    content: Text("Ans: $price "),
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
                  )
                ],
              ),
            ),

          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
