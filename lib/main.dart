import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  late Timer zamanlayici;
  int kalanSure = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Timer: $kalanSure"),
            ElevatedButton(
              onPressed: ()
              {

                zamanlayici = Timer.periodic(Duration(seconds: 1), (timer) {
                  setState(() {
                    kalanSure++;

                  });
                  if(kalanSure==10)
                  {
                    zamanlayici.cancel();
                    kalanSure=0;
                  }
                });

              },
              child: Text("Timer Başlat"),


            ),


          ],
        ),
      ),

    );
  }
}
