import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  String name = "";
  String des = "";
  String price = "";
  String stock = "";

  Item(String name, String des, String price, String stock) {
    this.name = name;
    this.des = des;
    this.price = price;
    this.stock = stock;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: SizedBox(
        width: 350.0,
        height: 370.0,
        child: Card(
          color: Color.fromRGBO(114, 128, 141, 1),
          child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "____________________________________",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromRGBO(148, 158, 168, 1),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        des,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      price,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(225, 233, 250, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      stock,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(207, 240, 207, 1),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        color: Colors.orange[300],
                        child: FlatButton( 
                          onPressed: null,
                          child: Text(
                            "Order Now!",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                          ),
                        ),
                      )),
                ],
              )),
          margin: EdgeInsets.all(5),
        ),
      ),
    );
  }
}
