import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testingapp/Countries.dart';
import 'package:testingapp/Districts.dart';
import 'package:testingapp/Employee.dart';
import 'package:testingapp/Quote.dart';
import 'package:testingapp/welcome.dart';

import 'Use.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  myappstate createState() => myappstate();
}

class myappstate extends State<MyApp> {
  List conutry;
  List<Data> dd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: FutureBuilder(
            future: getdata(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: dd.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            (MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Districts()))),
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child:
                                    Text("NAME:   " + dd[index].employeeName),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text("AGE:  " + dd[index].employeeAge),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                    "SALARY:   " + dd[index].employeeSalary),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }

  Future<List<Data>> getdata() async {
    var url = "http://dummy.restapiexample.com/api/v1/employees";
    http.Response r = await http.get(url);
    dd = Employee.fromJson(json.decode(r.body)).data;
    return dd;
  }
}
