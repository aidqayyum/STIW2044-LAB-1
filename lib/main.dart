import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<DropdownMenuItem<String>> listDrop = [];
  List<String> drop = ["Male", "Female"];
  final TextEditingController _agecontroller = TextEditingController();
  final TextEditingController _heightcontroller = TextEditingController();
  final TextEditingController _weightcontroller = TextEditingController();
  double 
      height = 0.0,
      weight = 0.0,
      result = 0.0;
  
  int age = 0;
  String bmr;
  String selectGender;
  String gendercontroller;
  String img = "assets/images/bmr1.png";

  void datagender(){
    listDrop = [];
    listDrop = drop.map((val) => new DropdownMenuItem<String>(
      child: new Text(val), value: val,)).toList();
  }

  @override
  Widget build(BuildContext context) {
    datagender();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('BMR Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(img, height: 120.0, fit: BoxFit.fill),
            Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
                  child: TextField(
                  style: TextStyle(
                    fontSize: 25.0,
                    height: 1.5,
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    labelText: "Age",
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.0),                    
                    ), 
                  ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _agecontroller,
              ),
            ),

            Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
                  child: TextField(
                  style: TextStyle(
                    fontSize: 25.0,
                    height: 1.5,
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    labelText: "Height (cm)",
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ), 
                  ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _heightcontroller,
              ),
            ),

            Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: TextField(
                  style: TextStyle(
                    fontSize: 25.0,
                    height: 1.5,
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    labelText: "Weight (kg)",
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ), 
                  ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _weightcontroller,
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Text('Gender:',
              style: TextStyle(
                fontSize: 25.0,
                height: 2.0
              ),
              ),
            ),

            Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: DropdownButton(
                    value: selectGender,
                    items: listDrop,
                    hint: Text("Male",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.grey
                      ),
                    ),
                    iconSize: 30,
  
                    onChanged: (gender){
                      selectGender = gender;
                      setState(() {
                        gendercontroller = gender;
                      });
                    },
                    ),
                ),

            Padding(
              padding: EdgeInsets.all(5),
              child: RaisedButton(
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                color: Colors.pink,
                child: Text("Calculate BMR",
                style: TextStyle(
                  fontSize: 20.0 ),),
                onPressed: _onPress,
              ),
            ),

            Text("BMR Result: $bmr",
            style: TextStyle(
              fontSize: 15, 
              ),
              ),

          ],
        ),
      ),
    );
  }


  void _onPress() {
    setState(() {
      age = int.parse(_agecontroller.text);
      height = double.parse(_heightcontroller.text);
      weight = double.parse(_weightcontroller.text);


      if(gendercontroller == "Male"){
         result = (10*weight)+(6.25*height)-(5*age)+5;
        }
      else if(gendercontroller == "Female"){
        result = (10*weight)+(6.25*height)-(5*age)-161;
        }
      bmr = format(result);
     
    });
    
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }
  
}
