import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //creating a card list
  List cardList = List();

  //creating a widget variable
  Widget widgetToBeShown = Text('');

  addCard() {
    setState(() {
      widgetToBeShown = Text('data');
    });

    cardList.add(Text('data'));

    Timer(Duration(microseconds: 50), () {
      setState(() {
        widgetToBeShown = GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: cardList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: cardList[index],
            );
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Builder'),
      ),
      body: widgetToBeShown,
      floatingActionButton: FloatingActionButton(
        onPressed: addCard,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
