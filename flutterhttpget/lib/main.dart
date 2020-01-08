import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(
    new MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch: Colors.deepPurple
      ),
));


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String url = "https://swapi.co/api/people";
  List data;


  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  //async method for getting the response from the http endpoint
  Future<String> getJsonData() async{
  var response = await http.get(
    //Encode the url
    Uri.encodeFull(url),
    //Accepts only json data
    headers: {"Accept":"application/json"}
  );

  setState(() {
    // JSON.decode is now called jsonDecode
    var convertedJsonData = jsonDecode(response.body);
    data = convertedJsonData['results'];
  });

  return "Success";

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Retrive JSON via Http Get"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: data == null? 0:data.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Text(data[index]['name']),
            leading: Icon(Icons.person_outline,
              color: Colors.deepPurpleAccent,),
              subtitle: Text("Gender: "+data[index]['gender']),
            onTap: (){},
          );
      },
      )
    );
  }


}
