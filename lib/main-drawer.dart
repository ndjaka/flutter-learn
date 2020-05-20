import 'package:flutter/material.dart';
import './quiz.dart';
import './camera.dart';
import './weather.dart';
import './gallery.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.deepOrange,Colors.white])
            ),
            child:Center(
              child:CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/photo.png'),
              ),
            ),
          ),
          ListTile(
            title: Text('Quiz',style: TextStyle(fontSize: 20),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Quiz()));
            },
          ),
          Divider( color: Colors.deepOrange,),
          ListTile(
            title: Text('Weather',style: TextStyle(fontSize: 20),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Weather()));
            },
          ),
          Divider( color: Colors.deepOrange,),
          ListTile(
            title: Text('Gallery',style: TextStyle(fontSize: 20),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Gallery()));
            },
          ),
          Divider( color: Colors.deepOrange,),
          ListTile(
            title: Text('Camera',style: TextStyle(fontSize: 20),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraPage()));
            },
          )
        ],
      ),
    );
  }
}
