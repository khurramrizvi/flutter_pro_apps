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
      primaryColor: Colors.deepPurple,
      accentColor: Colors.deepPurple[300]
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
      drawer: Drawer(
        elevation: 10,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.indigo, Colors.purpleAccent])
              ),
              arrowColor: Colors.white,
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("KR",style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple
                ),),
              ),
              accountName: Text("Khurram Rizvi"),
              accountEmail: Text("khurramrizvi@github.com"),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Types of Coins",style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
              ),
              ),
            ),

            Divider(
          height: 16,
            ),

            ListTile(
              onTap: (){},
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Text("B",style: TextStyle(color: Colors.black),),
              ),
              title: Text("Bitcoin", style: TextStyle(fontSize: 18),),
              trailing: Icon(Icons.arrow_drop_down),
            ),
            
            Padding(
              padding: EdgeInsets.all(8),
            ),

            ListTile(
              onTap: (){},
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text("E",style: TextStyle(color: Colors.black),),
              ),
              title: Text("Ethereum", style: TextStyle(fontSize: 18),),
              trailing: Icon(Icons.arrow_drop_down),
            ),

            Padding(
              padding: EdgeInsets.all(8),
            ),

            ListTile(
              onTap: (){},
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text("X",style: TextStyle(color: Colors.black),),
              ),
              title: Text("XRP", style: TextStyle(fontSize: 18),),
              trailing: Icon(Icons.arrow_drop_down),
            ),

            Padding(
              padding: EdgeInsets.all(8),
            ),

            ListTile(
              onTap: (){},
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text("T",style: TextStyle(color: Colors.black),),
              ),
              title: Text("Tether", style: TextStyle(fontSize: 18),),
              trailing: Icon(Icons.arrow_drop_down),
            ),


            Padding(
              padding: EdgeInsets.all(8),
            ),

            ListTile(
              onTap: (){},
              leading: CircleAvatar(
                backgroundColor: Colors.purpleAccent,
                child: Text("L",style: TextStyle(color: Colors.black),),
              ),
              title: Text("Litecoin", style: TextStyle(fontSize: 18),),
              trailing: Icon(Icons.arrow_drop_down),
            ),
            
            


          ],
        )
      ),
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
            expandedHeight: 250,
            floating: false,
            centerTitle: true,
            elevation: 10,
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

