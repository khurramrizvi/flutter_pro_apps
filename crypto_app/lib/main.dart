import 'dart:convert';

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:http/http.dart' as http;

void main() async{
  List currencies = await getCurrencies();
  runApp(
  MaterialApp(
    title: "CrytoApp",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.pink,
      accentColor: Colors.pinkAccent
    ),
    home: MyApp(currencies),
   )
  );
}


class MyApp extends StatelessWidget {
  final List _currencies;
  MyApp(this._currencies);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 10,
        title: Text("Crypto App",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),*/
      /*body: HomePage(_currencies),*/
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: Icon(Icons.menu,color: Colors.white,),
            expandedHeight: 150,
            floating: false,
            centerTitle: true,
            elevation: 50,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Crypto",style: TextStyle(
                color: Colors.white
              ),),
              background: Image.network(
                "https://cdn.dribbble.com/users/527354/screenshots/7503020/media/3a24369248757ed3678dacbda45a455e.png",
                fit: BoxFit.cover,
              ),
              collapseMode: CollapseMode.parallax,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            fillOverscroll: true,
            child: HomePage(_currencies),
          ),
        ],
      ),
    );
  }
}

Future<List> getCurrencies() async{
    String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
    http.Response response = await http.get(cryptoUrl);
    return jsonDecode(response.body);
  }

