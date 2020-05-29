import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class NavButtons extends StatelessWidget {
  void getdata() {
    var url = 'http://10.0.2.2:4000/api/items';
    http.get(url).then((response) {
       List<dynamic> extractedData = jsonDecode(response.body)['items'];
      extractedData.forEach( (value ) {
         print(value['name']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: IconButton(
                hoverColor: Colors.red,
                iconSize: 35,
                icon: Icon(Icons.refresh),
                color: Colors.white,
                onPressed: getdata,
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
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: IconButton(
                iconSize: 35,
                icon: Icon(Icons.account_box),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
