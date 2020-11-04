import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testingapp/Districts.dart';
import 'package:testingapp/States.dart';

void main() => runApp(welcome());

class welcome extends StatefulWidget {
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  States s;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getdatas(),

        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Regional> sss = s.data.regional;

            return ListView.builder(
                itemCount: sss.length,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: InkWell(
                      onTap: () => {
Navigator.push(context, MaterialPageRoute(builder: (BuildContext c)=> Districts())
)},
                      child: Card(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              sss[index].loc.toUpperCase(),
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Total Cases  " +
                                  sss[index]
                                      .totalConfirmed
                                      .toString()
                                      .toUpperCase(),
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Deaths  " + sss[index].deaths.toString(),
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Discharged  " + sss[index].discharged.toString(),
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      )),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<States> getdatas() async {
    var url = "https://api.rootnet.in/covid19-in/stats/latest";
    var d = await http.get(url);

    setState(() {
      s = States.fromJson(json.decode(d.body));
    });
    return s;
  }
}
