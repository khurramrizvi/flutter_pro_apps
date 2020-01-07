import 'package:calculatorapp/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var num1=0,num2=0,sum=0;

  final TextEditingController t1 = TextEditingController(text: "");
  final TextEditingController t2 = TextEditingController(text: "");


  @override
  void doAddition() {
    // TODO: implement setState
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1+num2;
    });
  }

  @override
  void doSubtraction() {
    // TODO: implement setState
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1-num2;
    });
  }

  @override
  void doMultiplication() {
    // TODO: implement setState
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1*num2;
    });
  }

  @override
  void doDivision() {
    // TODO: implement setState
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1~/num2;
    });
  }


  @override
  void doClear() {
    // TODO: implement setState
    setState(() {
      t1.text = "";
      t2.text = "";
      sum = 0;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator App"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Output : $sum",style: TextStyle(
                fontSize: 80,
                color: Colors.amberAccent
              ),
              ),
            ),

            TextField(
              controller: t1,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                alignLabelWithHint: true,
                hintText: "Enter 1st Number"
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),

            TextField(
              controller: t2,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                alignLabelWithHint: true,
                  hintText: "Enter 2nd Number"
              ),
            ),


            Padding(padding: EdgeInsets.all(20)),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                  shape:  RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.amberAccent)
                  ),
                  onPressed: doAddition,
                  color: Colors.yellowAccent,
                  child: Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Text("+",
                      style: TextStyle(
                      fontSize: 32
                    ),
                    ),
                  ),),

                MaterialButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.amber)
                  ),
                  onPressed: doSubtraction,
                  color: Colors.yellowAccent,
                  child: Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Text("-",style: TextStyle(
                      fontSize: 32
                    ),),
                  )),

              ],
            ),

            Padding(padding: EdgeInsets.only(top: 16)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.amber)
                    ),
                    onPressed: doMultiplication,
                    color: Colors.yellowAccent,
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text("*",style: TextStyle(
                        fontSize: 32,
                      ),),
                    )),


                MaterialButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.amber)
                  ),
                    onPressed: doDivision,
                    color: Colors.yellowAccent,
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 2.0),
                      child: Text("/",style: TextStyle(
                          fontSize: 32
                      ),),
                    )),
              ],
            ),
            
            Padding(padding: EdgeInsets.all(12)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                MaterialButton(
                  shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.red)
    ),
                  minWidth: 200,
                  onPressed: doClear,
                color: Colors.amber,
                child: Text("CLEAR",style: TextStyle(
                  fontSize: 20
                ),),)
              ],
            )


          ],
        ),
      ),
    );
  }
}
