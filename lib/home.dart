import 'package:flutter/material.dart';
import 'network.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _city;
  var data;
  String temp;
  String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/plant.jpg',),fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  onChanged: (value){
                    _city=value.toLowerCase();
                  },
                  style: TextStyle(color: Colors.black, letterSpacing: 2),
                  decoration: InputDecoration(
                    icon: Icon(Icons.location_city, color: Colors.white,),
                    hintText: 'Enter city name',
                    hintStyle: TextStyle(
                      color: Colors.grey
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20.0),
                child: FlatButton(
                  child: Text('Get Weather',
                  style:TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                  ),
                  ),
                  onPressed: ()async{
//                  temp=null;
                    data= await Network(url:'http://api.openweathermap.org/data/2.5/weather?q=$_city&appid=be033c67b361974b883b0a0fb9d924d4&units=metric').getData();
                    try {
                      temp = data['main']['temp'].toString();
                      temp='$temp°';
                      description=data['weather'][0]['description'];
                      description='${description[0].toUpperCase()}${description.substring(1)}';
                    }
                    catch(e){
                      temp='No such city :(';
                      description=null;
                    }
                    setState(() {

                    });
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  splashColor: Colors.pink[800],
                ),
              ),
              SizedBox(height: 50,),
              Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  Text(temp ?? '',
                  style: temp!='No such city :('?
                  TextStyle(fontSize: 90, fontWeight: FontWeight.w900,)
                      :TextStyle(fontSize: 40, fontWeight: FontWeight.w900)
                  ),

                ],
              ),

              SizedBox(height: 50,),
              Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  Container(
                    width: 300,
                    child: Text(description ?? '',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700)
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
//                  width: 300,
                    child: Text(temp==''||temp==null|| temp=='No such city :('? '':'${_city[0].toUpperCase()}${_city.substring(1)}',
                        style: TextStyle(fontSize: 70, fontWeight: FontWeight.w700)
                    ),
                  ),
                  SizedBox(width: 20,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
