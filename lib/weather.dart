import 'package:flutter/material.dart';
import './WeatherDetail.dart';

class Weather extends StatefulWidget {


  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String city = "";
  TextEditingController textEditingController =  new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(city),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(hintText: 'Taper une ville'),
                style: TextStyle(fontSize: 22),
                onChanged: (value) {
                  setState(() {
                    this.city = value;
                  });
                },
                onSubmitted: (value){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherDetail(city)));
                  textEditingController.text="";
                },
              ),
            ),
          ),
          Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: Colors.deepOrange,
                  child: Text(
                    'Get weather...',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherDetail(city)));
                    textEditingController.text="";
                  },
                ),
              )
          )
        ],
      ),
    );
  }
}
