import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'widgets/item.dart';
import 'models/singleItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Felix Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Felix Store App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  // var items = [
  //   new SingleItem("Lether Shoes2", "made from pure lether. Order soon!",
  //       "Rs: 5200.00", "In stock"),
  //   new SingleItem("Watch (Rolex)", "Imported from USA. Order soon!",
  //       "Rs: 10000.00", "In stock"),
  //   new SingleItem("Shirt (Men)", "made from pure cotton. Order soon!",
  //       "Rs: 1000.00", "In stock"),
  //   new SingleItem("Blouse", "made from pure cotton. Order soon!",
  //       "Rs: 2000.00", "In stock"),
  //   new SingleItem("Shoes", "made from pure lether. Order soon!", "Rs: 2200.00",
  //       "Out of stock")
  // ];

  var itemsArray = [];

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          title: Row(
            children: [
              Image.asset('assets/logo.png', fit: BoxFit.cover, width: 100),
              Text(
                "  FELIX STORE",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),
          backgroundColor: Color.fromRGBO(52, 58, 64, 1),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(220, 228, 235, 1),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(52, 58, 64, 1),
                            border: Border.all(
                              color: Color.fromRGBO(52, 58, 64, 1),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: IconButton(
                          hoverColor: Colors.red,
                          iconSize: 35,
                          icon: Icon(Icons.refresh),
                          color: Colors.white,
                          onPressed: refresh,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(52, 58, 64, 1),
                            border: Border.all(
                              color: Color.fromRGBO(52, 58, 64, 1),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: IconButton(
                          iconSize: 35,
                          icon: Icon(Icons.account_box),
                          color: Colors.white,
                          onPressed: getdata,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 600,
                color: Color.fromRGBO(220, 228, 235, 1),
                child: ListView(
                  children: getItems(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List getItems() {
    var commentWidgets = List<Widget>();
    for (var item in itemsArray) {
      commentWidgets.add(Item(item.name, item.des, item.price, item.stock));
    }
    return commentWidgets;
  }

  void getdata() {
     setState(() {
      itemsArray.removeRange(0, counter);
      counter=0;
    });
   
    var url = 'http://10.0.2.2:4000/api/items';
    http.get(url).then((response) {
      List<dynamic> extractedData = jsonDecode(response.body)['items'];
      extractedData.forEach((value) {
        //  print(value['name']);
        setState(() {
          itemsArray.add(new SingleItem(
              value['name'], value['des'], value['price'], value['stock']));
          counter++;
        });
      });
    });
  }

  void refresh() {
    setState(() {
      itemsArray.removeRange(0, counter);
      counter=0;
    });
     var url = 'http://10.0.2.2:4000/api/items';
    http.get(url).then((response) {
      List<dynamic> extractedData = jsonDecode(response.body)['items'];
      extractedData.forEach((value) {
        //  print(value['name']);
        setState(() {
          itemsArray.add(new SingleItem(
              value['name'], value['des'], value['price'], value['stock']));
          counter++;
        });
      });
    });
  }
}
