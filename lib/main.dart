import 'package:flutter/material.dart';
import 'package:myapp/main-drawer.dart';

import './main-drawer.dart';

void main(){
  runApp( MaterialApp(home:MyHomePage(),));
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(

      drawer: MainDrawer(),
      appBar: AppBar(title: Text('My App'),backgroundColor: Colors.deepOrange,),
        body: Center(child:
        Text('hello ',style: TextStyle(fontSize: 22,color: Colors.blue),) ),
      );

  }

}