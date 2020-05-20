import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WeatherDetail extends StatefulWidget {
  String city = "";

  WeatherDetail(this.city);

  @override
  _WeatherDetailState createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  var weatherData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData(widget.city);
  }

  getData(String city) {
    print("Getting weather of " + city);
    String url =
        'http://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=9c0472cd4b9fa96148b6ef5ce91e6e2c';
    http.get(url).then((resp) {
      setState(() {
        this.weatherData = json.decode(resp.body);
        print(this.weatherData);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wheather of city ${widget.city}'),
          backgroundColor: Colors.deepOrange,
        ),
        body: (weatherData == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount:
                    (weatherData == null ? 0 : weatherData['list'].length),
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.deepOrangeAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    'images/${weatherData['list'][index]['weather'][0]['main'].toString().toLowerCase()}.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "${new DateFormat('E-dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(weatherData['list'][index]['dt'] * 1000000))}",
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                    Text(
                                      "${new DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(weatherData['list'][index]['dt'] * 1000000))} "
                                      " | ${weatherData['list'][index]['weather'][0]['main']}",
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "${weatherData['list'][index]['main']['temp'].round()} °C",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                })));
  }
}
