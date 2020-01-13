import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  final List currencies;
  HomePage(this.currencies);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List currencies;
  final List<MaterialColor> _colors = [Colors.cyan, Colors.pink,Colors.deepPurple,Colors.deepOrange];




  Widget _cryptoWidget(){
    return Container(
        child: ListView.builder(
            itemCount: widget.currencies.length,
            itemBuilder: (context, index){

              final Map currency = widget.currencies[index];
              final MaterialColor color = _colors[index % _colors.length];

              return _getListItemUI(currency, color);
            }),

    );
  }


  Widget _getListItemUI(Map currency, MaterialColor color){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ListTile(
          onTap: (){},
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text(currency['name'][0]),
        ),
          title: Text(currency['name'],
            style: TextStyle(
            fontWeight: FontWeight.bold),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(right:4.0),
            child: _getSubtitle(currency['price_usd'], currency['percent_change_1h']),
          ),
          trailing: Icon(Icons.monetization_on),
          isThreeLine: false,

        ),

        Divider(
          height: 1,
        )
      ],
    );
  }


  Widget _getSubtitle(String price_usd, String percent_change_1h){
    TextSpan priceTextWidget = TextSpan(
      text: "\$$price_usd" , style: TextStyle(
      color: Colors.black
    ));

    String percentChangeText = "  1 hour: $percent_change_1h"+"%";

    TextSpan percentChangeTextWidget;

    if(double.parse(percent_change_1h)>0){
      percentChangeTextWidget = TextSpan(text: percentChangeText,style: TextStyle(
        color: Colors.red,fontWeight: FontWeight.w400
      ));
    }else{
      percentChangeTextWidget = TextSpan(text: percentChangeText,style: TextStyle(
          color: Colors.green, fontWeight: FontWeight.w400
      ));

    }

    return RichText(
      text: TextSpan(
        children: [priceTextWidget,percentChangeTextWidget]
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _cryptoWidget(),
    );
  }
}
